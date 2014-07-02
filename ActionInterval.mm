
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
    auto a = [[ClosureAction alloc] init];
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
