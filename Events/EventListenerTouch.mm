
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

//  EventListenerTouchOneByOne.mm
//  Created by Justin Graham on 6/21/14.

#import "EventListenerTouch.h"
#import "Event.h"
#import "Touch.h"
#include "CCEventListenerTouch.h"
#include "CCTouch.h"
#include "CCEvent.h"

@implementation EventListenerTouchOneByOne
- (id) init
{
    self.inner = cocos2d::EventListenerTouchOneByOne::create();
    INNER(e,EventListenerTouchOneByOne);
    e->onTouchBegan = [self](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        SET_OUTER(touch, Touch);
        SET_OUTER(event, Event);
        auto t = GET_OUTER(touch, Touch);
        auto e = GET_OUTER(event, Event);
        return self.onTouchBegan ? self.onTouchBegan(t, e) : true;
    };
    
    e->onTouchMoved = [self](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        SET_OUTER(touch, Touch);
        SET_OUTER(event, Event);
        auto t = GET_OUTER(touch, Touch);
        auto e = GET_OUTER(event, Event);
        if (self.onTouchMoved)
            self.onTouchMoved(t, e);
    };

    e->onTouchEnded = [self](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        SET_OUTER(touch, Touch);
        SET_OUTER(event, Event);
        auto t = GET_OUTER(touch, Touch);
        auto e = GET_OUTER(event, Event);
        if (self.onTouchEnded)
            self.onTouchEnded(t, e);
    };
    
    e->onTouchCancelled = [self](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        SET_OUTER(touch, Touch);
        SET_OUTER(event, Event);
        auto t = GET_OUTER(touch, Touch);
        auto e = GET_OUTER(event, Event);
        if (self.onTouchCancelled)
            self.onTouchCancelled(t, e);
    };
    
    return self;
}

+ (EventListenerTouchOneByOne*) create
{
    EventListenerTouchOneByOne* listener = [EventListenerTouchOneByOne alloc];
    [listener autorelease];
    return nil == [listener init] ? nil : listener;
}

- (bool) checkAvailable
{
    return nil != self.onTouchBegan;
}

- (EventListenerTouchOneByOne*) clone
{
    EventListenerTouchOneByOne* listener = [EventListenerTouchOneByOne create];
    if (listener)
    {
        listener.onTouchBegan = self.onTouchBegan;
        listener.onTouchMoved = self.onTouchMoved;
        listener.onTouchEnded = self.onTouchEnded;
        listener.onTouchCancelled = self.onTouchCancelled;
        listener.needSwallow = self.needSwallow;
        listener.claimedTouches = [NSArray arrayWithArray:self.claimedTouches];
    }
    return listener;
}
@end
