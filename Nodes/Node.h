
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

//  Node.h
//  Created by Justin Graham on 6/17/14.

#import "Ref.h"

@class Action;

typedef void(^tUpdateBlock)(float);

@interface Node : Ref
{
@protected
    tUpdateBlock _update;
    NSMutableArray* _children;
}

+ (Node*) create;

- (void) initCommon;

- (void) setAnchorPoint :(CGPoint)anchor;
- (CGPoint) getAnchorPoint;

- (void) setPosition :(CGPoint)pos;
- (void) setPosition :(float)x :(float)y;
- (CGPoint) getPosition;

- (float) getRotation;
- (void) setRotation :(float)r;

- (void) setOpacity :(float)a;
- (float) getOpacity;

- (void)  setScaleX :(float)scaleX;
- (void)  setScaleY :(float)scaleY;
- (void)  setScaleZ :(float)scaleZ;
- (float) getScaleX;
- (float) getScaleY;
- (float) getScaleZ;
- (void)  setScale :(float)scale;
- (float) getScale;
- (void)  setScale :(float)scaleX :(float)scaleY;

- (void) addChild :(Node*)child;
- (NSArray*) getChildren;
- (Node*) getParent;

- (CGSize) getContentSize;
- (void) setContentSize :(CGSize)size;

- (void) scheduleUpdate :(tUpdateBlock)update;
- (void) unscheduleUpdate;

- (CGPoint) convertToNodeSpace :(CGPoint)worldPoint;
- (CGPoint) convertToWorldSpace :(CGPoint)nodePoint;

- (Action*) runAction :(Action*)action;
- (void) stopAction :(Action*)action;
- (void) stopAllActions;

- (void) onEnter;
- (void) onExit;

- (void) removeFromParentAndCleanup :(bool)cleanup;

// private update method to avoid collision with update:
- (void) updatePrivate :(float)delta;
@end
