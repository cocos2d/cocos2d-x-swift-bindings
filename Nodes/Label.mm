
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

//  Label.mm
//  Created by Justin Graham on 6/25/14.

#import "Label.h"
#include "CCLabel.h"

@implementation Label

+ (Label*) create
{
    auto label = [Label alloc];
    label.inner = cocos2d::Label::create();
    return [label autorelease];
}

+ (Label*) createWithSystemFont :(NSString*)text :(NSString*)font :(float)fontSize
{
    auto label = [Label alloc];
    label.inner = cocos2d::Label::createWithSystemFont([text UTF8String], [font UTF8String], fontSize);
    return [label autorelease];
}

+ (Label*) createWithTTF :(NSString*)text :(NSString*)fontFile :(float)fontSize
{
    auto label = [Label alloc];
    label.inner = cocos2d::Label::createWithTTF([text UTF8String], [fontFile UTF8String], fontSize);
    return [label autorelease];
}

- (id) init
{
    [self initCommon];
    return self;
}

- (void) setString :(NSString*)text
{
    INNER(l,Label);
    l->setString([text UTF8String]);
}

- (void) setTextColor :(Color4B*)color
{
    INNER(l,Label);
    cocos2d::Color4B c(color.r, color.g, color.b, color.a);
    l->setTextColor(c);
}

- (void) enableShadow :(Color4B*)color :(CGSize)offset :(int)blurRadius
{
    INNER(l,Label);
    cocos2d::Color4B c(color.r, color.g, color.b, color.a);
    l->enableShadow(c, cocos2d::Size(offset.width, offset.height), blurRadius);
}

- (void) enableOutline :(Color4B*)outlineColor :(int)outlineSize
{
    INNER(l,Label);
    cocos2d::Color4B c(outlineColor.r, outlineColor.g, outlineColor.b, outlineColor.a);
    l->enableOutline(c, outlineSize);
}

- (void) enableGlow :(Color4B*)glowColor
{
    INNER(l,Label);
    cocos2d::Color4B c(glowColor.r, glowColor.g, glowColor.b, glowColor.a);
    l->enableGlow(c);
}

- (void) disableEffect
{
    INNER(l,Label);
    l->disableEffect();
}

@end
