
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

//  Ref.mm
//  Created by Justin Graham on 6/17/14.

#import "Ref.h"
#include "CCRef.h"
#include "CCNode.h"

@implementation Ref
- (void) dealloc
{
    if (_inner)
    {
        auto n = static_cast<cocos2d::Ref*>(_inner);
        n->release();
    }
    [super dealloc];
}

- (id) retain
{
    auto ref = (cocos2d::Ref*)_inner;
    ref->retain();
    return [super retain];
}

- (void) release
{
    auto ref = (cocos2d::Ref*)_inner;
    ref->release();
    [super release];
}

- (void*) inner
{
    return _inner;
}

- (void) setInner:(void*)inner
{
    if (_inner)
    {
        [self retain];
        _inner = nil;
    }
    if (inner)
    {
        _inner = inner;
        [self retain];
        auto n = static_cast<cocos2d::Ref*>(inner);
        n->_scriptObject = self;
    }
}
@end
