
/****************************************************************************
 Copyright (c) 2014 Chukong Technologies Inc.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

//  ActionEase.mm
//  Created by Justin Graham on 7/11/14.

#import "ActionEase.h"
#include "CCActionEase.h"

namespace
{
    class _wrap_ActionEase : public cocos2d::ActionEase
    {
    public:
        static _wrap_ActionEase* create(ActionInterval* action)
        {
            auto a = new _wrap_ActionEase;
            a->initWithAction(action);
            return a;
        }
        _wrap_ActionEase* clone() const override
        {
            return _wrap_ActionEase::create(_inner);
        }
        _wrap_ActionEase* reverse() const override
        {
            return nullptr;
        }
        void update(float t) override
        {
            ::ActionInterval* a = GET_OUTER(this,::ActionInterval);
            [a update:t];
        }
    };

    class _wrap_EaseRateAction : public cocos2d::EaseRateAction
    {
    public:
        static _wrap_EaseRateAction* create(ActionInterval* action, float rate)
        {
            auto a = new _wrap_EaseRateAction;
            a->initWithAction(action, rate);
            return a;
        }
        _wrap_EaseRateAction* clone() const override
        {
            return _wrap_EaseRateAction::create(_inner, _rate);
        }
        _wrap_EaseRateAction* reverse() const override
        {
            return nullptr;
        }
        void update(float t) override
        {
            ::ActionInterval* a = GET_OUTER(this,::ActionInterval);
            [a update:t];
        }
    };
}

@implementation ActionEase
- (ActionInterval*) getInnerAction
{
    INNER(a,ActionInterval);
    return GET_OUTER(a,ActionInterval);
}
@end

@implementation EaseRateAction
- (void) setRate :(float)rate
{
    INNER(a,EaseRateAction);
    a->setRate(rate);
}
- (float) getRate
{
    INNER(a,EaseRateAction);
    return a->getRate();
}
@end

#define ACTION_BEGIN(A,B) \
    @implementation A

#define ACTION_CREATE(A) \
    + (A*) create :(ActionInterval*)action \
    { \
        auto a = [A new]; \
        a.inner = _wrap_ActionEase::create(static_cast<cocos2d::ActionInterval*>(action.inner)); \
        return a; \
    }

#define ACTION_END \
    @end

#define ACTION(A,B) \
    ACTION_BEGIN(A,B) \
    ACTION_CREATE(A); \
    ACTION_END

#define EASE_RATE_ACTION(A,B) \
    ACTION_BEGIN(A,B) \
    + (A*) create :(ActionInterval*)action :(float)rate; \
    { \
        auto a = [A new]; \
        a.inner = _wrap_EaseRateAction::create(static_cast<cocos2d::ActionInterval*>(action.inner), rate); \
        return a; \
    } \
    ACTION_END


EASE_RATE_ACTION(EaseIn,EaseRateAction)
EASE_RATE_ACTION(EaseOut,EaseRateAction)
EASE_RATE_ACTION(EaseInOut,EaseRateAction)
EASE_RATE_ACTION(EaseExponentialIn,ActionEase)
EASE_RATE_ACTION(EaseExponentialOut,ActionEase)
EASE_RATE_ACTION(EaseExponentialInOut,ActionEase)
EASE_RATE_ACTION(EaseSineIn,ActionEase)
EASE_RATE_ACTION(EaseSineOut,ActionEase)
EASE_RATE_ACTION(EaseSineInOut,ActionEase)

ACTION_BEGIN(EaseElastic,ActionEase)
- (float) getPeriod
{
    INNER(a,EaseElastic);
    return a->getPeriod();
}
- (void) setPeriod :(float)period
{
    INNER(a,EaseElastic);
    a->setPeriod(period);
}
ACTION_END

ACTION_BEGIN(EaseElasticIn,EaseElastic)
ACTION_CREATE(EaseElasticIn);
+ (EaseElasticIn*) create :(ActionInterval*)action :(float)period
{
    auto a = [EaseElasticIn new];
    a.inner = _wrap_EaseRateAction::create(static_cast<cocos2d::ActionInterval*>(action.inner), period);
    return a;
}
ACTION_END

EASE_RATE_ACTION(EaseElasticOut,EaseElastic)
EASE_RATE_ACTION(EaseElasticInOut,EaseElastic)
EASE_RATE_ACTION(EaseBounce,ActionEase)
EASE_RATE_ACTION(EaseBounceIn,EaseBounce)
EASE_RATE_ACTION(EaseBounceOut,EaseBounce)
EASE_RATE_ACTION(EaseBounceInOut,EaseBounce)
EASE_RATE_ACTION(EaseBackIn,ActionEase)
EASE_RATE_ACTION(EaseBackOut,ActionEase)
EASE_RATE_ACTION(EaseBackInOut,ActionEase)
EASE_RATE_ACTION(EaseQuadraticActionIn,ActionEase)
EASE_RATE_ACTION(EaseQuadraticActionOut,ActionEase)
EASE_RATE_ACTION(EaseQuadraticActionInOut,ActionEase)
EASE_RATE_ACTION(EaseQuarticActionIn,ActionEase)
EASE_RATE_ACTION(EaseQuarticActionOut,ActionEase)
EASE_RATE_ACTION(EaseQuarticActionInOut,ActionEase)
EASE_RATE_ACTION(EaseQuinticActionIn,ActionEase)
EASE_RATE_ACTION(EaseQuinticActionOut,ActionEase)
EASE_RATE_ACTION(EaseQuinticActionInOut,ActionEase)
EASE_RATE_ACTION(EaseCircleActionIn,ActionEase)
EASE_RATE_ACTION(EaseCircleActionOut,ActionEase)
EASE_RATE_ACTION(EaseCircleActionInOut,ActionEase)
EASE_RATE_ACTION(EaseCubicActionIn,ActionEase)
EASE_RATE_ACTION(EaseCubicActionOut,ActionEase)
EASE_RATE_ACTION(EaseCubicActionInOut,ActionEase)

#undef ACTION
#undef ACTION_BEGIN
#undef ACTION_END
#undef ACTION_CREATE
#undef EASE_RATE_ACTION

