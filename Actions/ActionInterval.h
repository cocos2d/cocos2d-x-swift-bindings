
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

//  ActionInterval.h
//  Created by Justin Graham on 6/26/14.

#import "Action.h"

@interface ActionInterval : FiniteTimeAction
@property (nonatomic,readonly) float getElapsed;
@property (nonatomic,readonly) bool firstTick;
- (void) update :(float)t;
@end

typedef void(^closureActionBlock)(float time);
@interface ClosureAction : ActionInterval
@property (nonatomic,copy) closureActionBlock delegate;
+ (ClosureAction*) createWithDuration :(float)duration :(closureActionBlock)delegate;
@end

@interface Spawn : ActionInterval
+ (Spawn*) create :(NSArray*)actions;
+ (Spawn*) createWithTwoActions :(FiniteTimeAction*)action1 :(FiniteTimeAction*)action2;
@end

@interface Repeat : ActionInterval
+ (Repeat*) create :(FiniteTimeAction*)action :(unsigned int)times;
@end

@interface RepeatForever : ActionInterval
+ (RepeatForever*) create :(ActionInterval*)action;
@end

@interface RotateTo : ActionInterval
+ (RotateTo*) create :(float)duration :(float)deltaAngleX :(float)deltaAngleY;
+ (RotateTo*) create :(float)duration :(float)deltaAngle;
@end


@interface RotateBy : ActionInterval
+ (RotateBy*) create :(float)duration :(float) deltaAngle;
+ (RotateBy*) create :(float)duration :(float) deltaAngleZ_X :(float)deltaAngleZ_Y;
@end

@interface MoveBy : ActionInterval
+ (MoveBy*) create :(float)duration :(CGPoint)deltaPosition;
@end

@interface MoveTo : MoveBy
+ (MoveTo*) create :(float)duration :(CGPoint)position;
@end

@interface SkewTo : ActionInterval
+ (SkewTo*) create :(float)t :(float)sx :(float)sy;
@end

@interface SkewBy : SkewTo
+ (SkewBy*) create :(float)t :(float)deltaSkewX :(float)deltaSkewY;
@end


@interface JumpBy : ActionInterval
+ (JumpBy*) create :(float)duration :(CGPoint)position :(float)height :(int)jumps;
@end

@interface JumpTo : JumpBy
+ (JumpTo*) create :(float)duration :(CGPoint)position :(float)height :(int)jumps;
@end

@interface ScaleTo : ActionInterval
+ (ScaleTo*) create :(float)duration :(float)s;
+ (ScaleTo*) create :(float)duration :(float)sx :(float)sy;
+ (ScaleTo*) create :(float)duration :(float)sx :(float)sy :(float)sz;
@end

@interface ScaleBy : ScaleTo
+ (ScaleBy*) create :(float)duration :(float)s;
+ (ScaleBy*) create :(float)duration :(float)sx :(float)sy;
+ (ScaleBy*) create :(float)duration :(float)sx :(float)sy :(float)sz;
@end
   
@interface Blink : ActionInterval
+ (Blink*) create :(float)duration :(int)blinks;
@end

@interface FadeTo : ActionInterval
+ (FadeTo*) create :(float)duration :(unsigned)opacity;
@end

@interface FadeIn : FadeTo
+ (FadeIn*) create :(float)d;
@end
   
@interface FadeOut : FadeTo
+ (FadeOut*) create :(float)d;
@end
   
@interface TintTo : ActionInterval
+ (TintTo*) create :(float)duration :(unsigned)red :(unsigned)green :(unsigned)blue;
@end
   
@interface TintBy : ActionInterval
+ (TintBy*) create :(float)duration :(unsigned)deltaRed :(unsigned)deltaGreen :(unsigned)deltaBlue;
@end
   
@interface DelayTime : ActionInterval
+ (DelayTime*) create :(float)d;
@end

@interface ReverseTime : ActionInterval
+ (ReverseTime*) create :(FiniteTimeAction*)action;
@end

