
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

//  Transitions.m
//  Created by Justin Graham on 6/27/14.

#import "Transitions.h"
#include "CCTransition.h"

@implementation TransitionScene
+ (TransitionScene*) create :(float)duration :(Scene*)scene
{
    [scene retain];
    TransitionScene* transition = [TransitionScene new];
    transition.inner = cocos2d::TransitionScene::create(duration, static_cast<cocos2d::Scene*>(scene.inner));
    return [transition autorelease];
}
@end

@implementation TransitionFade
+ (TransitionFade*) create :(float)duration :(Scene*)scene
{
    [scene retain];
    TransitionFade* transition = [TransitionFade new];
    transition.inner = cocos2d::TransitionFade::create(duration, static_cast<cocos2d::Scene*>(scene.inner));
    return [transition autorelease];
}
@end
