
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

//  Layer.mm
//  Created by Justin Graham on 6/28/14.

#import "Layer.h"
#include "CCLayer.h"

@implementation Layer
@end

@implementation LayerColor
+ (LayerColor*) create
{
    auto l = [LayerColor new];
    l.inner = cocos2d::LayerColor::create();
    return l;
}

+ (LayerColor*) create :(Color4B*)color :(float)width :(float)height
{
    auto l = [LayerColor new];
    cocos2d::Color4B c;
    c.r = color.r;
    c.g = color.g;
    c.b = color.b;
    c.a = color.a;
    l.inner = cocos2d::LayerColor::create(c, width, height);
    return l;
}

+ (LayerColor*) create :(Color4B*)color
{
    auto l = [LayerColor new];
    cocos2d::Color4B c;
    c.r = color.r;
    c.g = color.g;
    c.b = color.b;
    c.a = color.a;
    l.inner = cocos2d::LayerColor::create(c);
    return l;
}

- (void) changeWidth :(float)w
{
    INNER(l,LayerColor);
    l->changeWidth(w);
}

- (void) changeHeight :(float)h
{
    INNER(l,LayerColor);
    l->changeHeight(h);
}

- (void) changeWidthAndHeight :(float)w :(float)h
{
    INNER(l,LayerColor);
    l->changeWidthAndHeight(w, h);
}
@end