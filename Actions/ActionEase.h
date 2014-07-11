
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

//  ActionEase.h
//  Created by Justin Graham on 7/11/14.

#import "ActionInterval.h"

@interface ActionEase : ActionInterval
- (ActionInterval*) getInnerAction;
@end

@interface EaseRateAction : ActionEase
- (void) setRate :(float)rate;
- (float) getRate;
@end

#define ACTION_BEGIN(A,B) \
    @interface A : B

#define ACTION_CREATE(A) \
    + (A*) create :(ActionInterval*)action :(float)rate

#define ACTION_END \
    @end

#define ACTION(A,B) \
    ACTION_BEGIN(A,B) \
    ACTION_CREATE(A); \
    ACTION_END

ACTION(EaseIn,EaseRateAction)
ACTION(EaseOut,EaseRateAction)
ACTION(EaseInOut,EaseRateAction)
ACTION(EaseExponentialIn,ActionEase)
ACTION(EaseExponentialOut,ActionEase)
ACTION(EaseExponentialInOut,ActionEase)
ACTION(EaseSineIn,ActionEase)
ACTION(EaseSineOut,ActionEase)
ACTION(EaseSineInOut,ActionEase)

ACTION_BEGIN(EaseElastic,ActionEase)
- (float) getPeriod;
- (void) setPeriod :(float)period;
ACTION_END

ACTION_BEGIN(EaseElasticIn,EaseElastic)
ACTION_CREATE(EaseElasticIn);
+ (EaseElasticIn*) create :(ActionInterval*)action :(float)period;
ACTION_END

ACTION_BEGIN(EaseElasticOut,EaseElastic)
ACTION_CREATE(EaseElasticOut);
+ (EaseElasticOut*) create :(ActionInterval*)action :(float)period;
ACTION_END

ACTION_BEGIN(EaseElasticInOut,EaseElastic)
ACTION_CREATE(EaseElasticInOut);
+ (EaseElasticInOut*) create :(ActionInterval*)action :(float)period;
ACTION_END

ACTION(EaseBounce,ActionEase)
ACTION(EaseBounceIn,EaseBounce)
ACTION(EaseBounceOut,EaseBounce)
ACTION(EaseBounceInOut,EaseBounce)
ACTION(EaseBackIn,ActionEase)
ACTION(EaseBackOut,ActionEase)
ACTION(EaseBackInOut,ActionEase)
ACTION(EaseQuadraticActionIn,ActionEase)
ACTION(EaseQuadraticActionOut,ActionEase)
ACTION(EaseQuadraticActionInOut,ActionEase)
ACTION(EaseQuarticActionIn,ActionEase)
ACTION(EaseQuarticActionOut,ActionEase)
ACTION(EaseQuarticActionInOut,ActionEase)
ACTION(EaseQuinticActionIn,ActionEase)
ACTION(EaseQuinticActionOut,ActionEase)
ACTION(EaseQuinticActionInOut,ActionEase)
ACTION(EaseCircleActionIn,ActionEase)
ACTION(EaseCircleActionOut,ActionEase)
ACTION(EaseCircleActionInOut,ActionEase)
ACTION(EaseCubicActionIn,ActionEase)
ACTION(EaseCubicActionOut,ActionEase)
ACTION(EaseCubicActionInOut,ActionEase)

#undef ACTION
#undef ACTION_BEGIN
#undef ACTION_END
#undef ACTION_CREATE

