
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

//  EventDispatcher.mm
//  Created by Justin Graham on 6/21/14.

#import "EventDispatcher.h"
#import "Event.h"
#import "EventListener.h"
#import "Node.h"
#include "CCDirector.h"
#include "CCEventDispatcher.h"
#include "CCEvent.h"
#include "CCNode.h"

@implementation EventDispatcher
- (id) init
{
    self.inner = cocos2d::Director::getInstance()->getEventDispatcher();
    return self;
}

- (void) addEventListenerWithSceneGraphPriority :(EventListener*)listener  :(Node*)node
{
    INNER(d,EventDispatcher);
    [listener retain];
    d->addEventListenerWithSceneGraphPriority(static_cast<cocos2d::EventListener*>(listener.inner), static_cast<cocos2d::Node*>(node.inner));
}

- (void) removeEventListener :(EventListener*) listener
{
    INNER(d,EventDispatcher);
    d->removeEventListener(static_cast<cocos2d::EventListener*>(listener.inner));
    [listener release];
}

- (void) removeEventListenersForTarget :(Node*)target :(bool)recursive
{
    INNER(d,EventDispatcher);
    d->removeEventListenersForTarget(static_cast<cocos2d::Node*>(target.inner), recursive);
}

- (void) dispatchEvent :(Event*) event
{
    INNER(d,EventDispatcher);
    d->dispatchEvent(static_cast<cocos2d::Event*>(event.inner));
}
@end
