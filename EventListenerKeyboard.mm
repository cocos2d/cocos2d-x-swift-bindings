
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

//  EventListenerKeyboard.mm
//  Created by Justin Graham on 6/30/14.

#import "EventListenerKeyboard.h"
#import "Event.h"
#include "CCEventListenerKeyboard.h"

@implementation EventListenerKeyboard
- (id) init
{
    self.inner = cocos2d::EventListenerKeyboard::create();
    INNER(e,EventListenerKeyboard);

    e->onKeyPressed = [self](cocos2d::EventKeyboard::KeyCode kc, cocos2d::Event* event)
    {
        SET_OUTER(event, Event);
        auto e = GET_OUTER(event, Event);
        if (self.onKeyPressed)
            self.onKeyPressed(KeyCode(kc), e);
    };
    
    e->onKeyReleased = [self](cocos2d::EventKeyboard::KeyCode kc, cocos2d::Event* event)
    {
        SET_OUTER(event, Event);
        auto e = GET_OUTER(event, Event);
        if (self.onKeyReleased)
            self.onKeyReleased(KeyCode(kc), e);
    };
    
    return self;
}

+ (EventListenerKeyboard*) create
{
    EventListenerKeyboard* listener = [EventListenerKeyboard alloc];
    [listener autorelease];
    return nil == [listener init] ? nil : listener;
}

- (bool) checkAvailable
{
    return nil != self.onKeyPressed || nil != self.onKeyReleased;
}

- (EventListenerKeyboard*) clone
{
    EventListenerKeyboard* listener = [EventListenerKeyboard create];
    if (listener)
    {
        listener.onKeyPressed = self.onKeyPressed;
        listener.onKeyReleased = self.onKeyReleased;
    }
    return listener;
}
@end
