
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

//  Label.h
//  Created by Justin Graham on 6/25/14.

#import "Node.h"
#import "Color.h"

@interface Label : Node
+ (Label*) create;
+ (Label*) createWithSystemFont :(NSString*)text :(NSString*)font :(float)fontSize;
+ (Label*) createWithTTF :(NSString*)text :(NSString*)fontFile :(float)fontSize;
- (void) setString :(NSString*)text;
- (void) enableShadow :(Color4B*)color :(CGSize)offset :(int)blurRadius;
- (void) enableOutline :(Color4B*)outlineColor :(int)outlineSize;
- (void) enableGlow :(Color4B*)glowColor;
- (void) disableEffect;
@end
