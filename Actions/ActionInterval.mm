
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

//  ActionInterval.mm
//  Created by Justin Graham on 6/26/14.

#import "ActionInterval.h"
#include "CCActionInterval.h"

namespace
{
    // purpose of this wrapper class is to gain access to update
    class _wrap_ActionInterval : public cocos2d::ActionInterval
    {
    public:
        static _wrap_ActionInterval* create(float duration)
        {
            auto a = new _wrap_ActionInterval;
            a->initWithDuration(duration);
            return a;
        }
        _wrap_ActionInterval* reverse() const override
        {
            return _wrap_ActionInterval::create(-_duration);
        }
        _wrap_ActionInterval* clone() const override
        {
            return _wrap_ActionInterval::create(_duration);
        }
        void update(float t) override
        {
            ::ActionInterval* a = GET_OUTER(this,::ActionInterval);
            [a update:t];
        }
    };
}

@implementation ActionInterval
- (void) update :(float)t
{
    // does nothing
}
@end

@implementation ClosureAction
+ (ClosureAction*) createWithDuration :(float)duration :(closureActionBlock)delegate
{
    auto a = [ClosureAction new];
    a.inner = _wrap_ActionInterval::create(duration);
    a.delegate = delegate;
    return a;
}

- (void) update :(float)t
{
    if (self.delegate)
        self.delegate(t);
}
@end

@implementation Spawn
+ (Spawn*) create :(NSArray*)actions
{
    auto a = [Spawn new];
    cocos2d::Vector<cocos2d::FiniteTimeAction*> arrayOfActions;
    for (Action* action in actions)
    {
        [action retain]; // match inner retain below
        arrayOfActions.pushBack(static_cast<cocos2d::FiniteTimeAction*>(action.inner));
    }
    a.inner = cocos2d::Spawn::create(arrayOfActions);
    return a;
}

+ (Spawn*) createWithTwoActions :(FiniteTimeAction*)action1 :(FiniteTimeAction*)action2
{
    auto a = [Spawn new];
    a.inner = cocos2d::Spawn::createWithTwoActions(static_cast<cocos2d::FiniteTimeAction*>(action1.inner), static_cast<cocos2d::FiniteTimeAction*>(action2.inner));
    return a;
}
@end

@implementation Repeat
+ (Repeat*) create :(FiniteTimeAction*)action :(unsigned int)times
{
    auto a = [Repeat new];
    a.inner = cocos2d::Repeat::create(static_cast<cocos2d::FiniteTimeAction*>(action.inner), times);
    return a;
}
@end

@implementation RepeatForever
+ (RepeatForever*) create :(ActionInterval*)action
{
    auto a = [RepeatForever new];
    a.inner = cocos2d::RepeatForever::create(static_cast<cocos2d::ActionInterval*>(action.inner));
    return a;
}
@end

@implementation RotateTo
+ (RotateTo*) create :(float)duration :(float)deltaAngleX :(float)deltaAngleY
{
    auto a = [RotateTo new];
    a.inner = cocos2d::RotateTo::create(duration, deltaAngleX, deltaAngleY);
    return a;
}
+ (RotateTo*) create :(float)duration :(float)deltaAngle;
{
    auto a = [RotateTo new];
    a.inner = cocos2d::RotateTo::create(duration, deltaAngle);
    return a;
}
@end

@implementation RotateBy
+ (RotateBy*) create :(float)duration :(float) deltaAngle;
{
    auto a = [RotateBy new];
    a.inner = cocos2d::RotateBy::create(duration, deltaAngle);
    return a;
}
+ (RotateBy*) create :(float)duration :(float) deltaAngleZ_X :(float)deltaAngleZ_Y;
{
    auto a = [RotateBy new];
    a.inner = cocos2d::RotateBy::create(duration, deltaAngleZ_X, deltaAngleZ_Y);
    return a;
}
@end

@implementation MoveBy
+ (MoveBy*) create :(float)duration :(CGPoint)deltaPosition;
{
    auto a = [MoveBy new];
    a.inner = cocos2d::MoveBy::create(duration, cocos2d::Vec2(deltaPosition.x, deltaPosition.y));
    return a;
}
@end

@implementation MoveTo
+ (MoveTo*) create :(float)duration :(CGPoint)position;
{
    auto a = [MoveTo new];
    a.inner = cocos2d::MoveTo::create(duration, cocos2d::Vec2(position.x, position.y));
    return a;
}
@end

@implementation SkewTo
+ (SkewTo*) create :(float)t :(float)sx :(float)sy;
{
    auto a = [SkewTo new];
    a.inner = cocos2d::SkewTo::create(t, sx, sy);
    return a;
}
@end

@implementation SkewBy
+ (SkewBy*) create :(float)t :(float)deltaSkewX :(float)deltaSkewY;
{
    auto a = [SkewBy new];
    a.inner = cocos2d::SkewBy::create(t, deltaSkewX, deltaSkewY);
    return a;
}
@end

@implementation JumpBy
+ (JumpBy*) create :(float)duration :(CGPoint)position :(float)height :(int)jumps;
{
    auto a = [JumpBy new];
    a.inner = cocos2d::JumpBy::create(duration, cocos2d::Vec2(position.x, position.y), height, jumps);
    return a;
}
@end

@implementation JumpTo
+ (JumpTo*) create :(float)duration :(CGPoint)position :(float)height :(int)jumps;
{
    auto a = [JumpTo new];
    a.inner = cocos2d::JumpTo::create(duration, cocos2d::Vec2(position.x, position.y), height, jumps);
    return a;
}
@end

@implementation ScaleTo
+ (ScaleTo*) create :(float)duration :(float)s;
{
    auto a = [ScaleTo new];
    a.inner = cocos2d::ScaleTo::create(duration, s);
    return a;
}
+ (ScaleTo*) create :(float)duration :(float)sx :(float)sy;
{
    auto a = [ScaleTo new];
    a.inner = cocos2d::ScaleTo::create(duration, sx, sy);
    return a;
}
+ (ScaleTo*) create :(float)duration :(float)sx :(float)sy :(float)sz;
{
    auto a = [ScaleTo new];
    a.inner = cocos2d::ScaleTo::create(duration, sx, sy, sz);
    return a;
}
@end

@implementation ScaleBy
+ (ScaleBy*) create :(float)duration :(float)s
{
    auto a = [ScaleBy new];
    a.inner = cocos2d::ScaleBy::create(duration, s);
    return a;
}
+ (ScaleBy*) create :(float)duration :(float)sx :(float)sy
{
    auto a = [ScaleBy new];
    a.inner = cocos2d::ScaleBy::create(duration, sx, sy);
    return a;
}
+ (ScaleBy*) create :(float)duration :(float)sx :(float)sy :(float)sz
{
    auto a = [ScaleBy new];
    a.inner = cocos2d::ScaleBy::create(duration, sx, sy, sz);
    return a;
}
@end

@implementation Blink
+ (Blink*) create :(float)duration :(int)blinks;
{
    auto a = [Blink new];
    a.inner = cocos2d::Blink::create(duration, blinks);
    return a;
}
@end

@implementation FadeTo
+ (FadeTo*) create :(float)duration :(unsigned)opacity;
{
    auto a = [FadeTo new];
    a.inner = cocos2d::FadeTo::create(duration, opacity);
    return a;
}
@end

@implementation FadeIn
+ (FadeIn*) create :(float)d;
{
    auto a = [FadeIn new];
    a.inner = cocos2d::FadeIn::create(d);
    return a;
}
@end

@implementation FadeOut
+ (FadeOut*) create :(float)d;
{
    auto a = [FadeOut new];
    a.inner = cocos2d::FadeOut::create(d);
    return a;
}
@end

@implementation TintTo
+ (TintTo*) create :(float)duration :(unsigned)red :(unsigned)green :(unsigned)blue
{
    auto a = [TintTo new];
    a.inner = cocos2d::TintTo::create(duration, red, green, blue);
    return a;
}
@end

@implementation TintBy
+ (TintBy*) create :(float)duration :(unsigned)deltaRed :(unsigned)deltaGreen :(unsigned)deltaBlue;
{
    auto a = [TintBy new];
    a.inner = cocos2d::TintBy::create(duration, deltaRed, deltaGreen, deltaBlue);
    return a;
}
@end

@implementation DelayTime
+ (DelayTime*) create :(float)d;
{
    auto a = [DelayTime new];
    a.inner = cocos2d::DelayTime::create(d);
    return a;
}
@end

@implementation ReverseTime
+ (ReverseTime*) create :(FiniteTimeAction*)action;
{
    auto a = [ReverseTime new];
    a.inner = cocos2d::ReverseTime::create(static_cast<cocos2d::FiniteTimeAction*>(action.inner));
    return a;
}
@end
   



