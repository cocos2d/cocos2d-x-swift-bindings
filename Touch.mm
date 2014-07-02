
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

//  Touch.m
//  Created by Justin Graham on 6/21/14.

#import "Touch.h"
#include "CCTouch.h"

@implementation Touch
- (CGPoint) getLocation
{
    INNER(t,Touch);
    auto v = t->getLocation();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getPreviousLocation
{
    INNER(t,Touch);
    auto v = t->getPreviousLocation();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getStartLocation
{
    INNER(t,Touch);
    auto v = t->getStartLocation();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getDelta
{
    INNER(t,Touch);
    auto v = t->getDelta();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getLocationInView
{
    INNER(t,Touch);
    auto v = t->getLocationInView();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getPreviousLocationInView
{
    INNER(t,Touch);
    auto v = t->getPreviousLocationInView();
    return CGPointMake(v.x, v.y);
}

- (CGPoint) getStartLocationInView
{
    INNER(t,Touch);
    auto v = t->getStartLocationInView();
    return CGPointMake(v.x, v.y);
}

- (void) setTouchInfo :(int)id :(float)x :(float)y
{
    INNER(t,Touch);
    t->setTouchInfo(id, x, y);
}

- (int) getID
{
    INNER(t,Touch);
    return t->getID();
}
@end
