
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

//  Ref.h
//  Created by Justin Graham on 6/17/14.

#import "Foundation/Foundation.h"
#import "CoreGraphics/CoreGraphics.h"

@interface Ref : NSObject
{
@protected
    void* _inner;
}
- (id) retain;
- (void) release;
@property (assign,nonatomic) void* inner;
@end

#define INNER(v,T) cocos2d::T* v = static_cast<cocos2d::T*>(self.inner)
#define INNERNS(v,T) T* v = static_cast<T*>(self.inner)

#define GET_OUTER(v,T) static_cast<T*>(v->_scriptObject)

#define SET_OUTER(v,T) \
    if (nullptr == v->_scriptObject) \
    { \
        T* t = [[T alloc] init]; \
        t.inner = v; \
        v->_scriptObject = t; \
    } \
    else \
    { \
        T* t = static_cast<T*>(v->_scriptObject); \
        t.inner = v; \
    }

