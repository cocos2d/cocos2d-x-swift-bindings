
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

//  Node.mm
//  Created by Justin Graham on 6/17/14.

#import "Node.h"
#import "Action.h"
#include "CCNode.h"
#include "CCComponent.h"
#include "CCAction.h"

namespace {
    // wrapper to access update
    class updateComponent
        : public cocos2d::Component
    {
    public:
        static updateComponent* create(Node* instance)
        {
            auto ret = new updateComponent(instance);
            if (ret && ret->init())
            {
                ret->autorelease();
            }
            else
            {
                CC_SAFE_DELETE(ret);
            }
            return ret;
        }
        updateComponent(Node* instance)
            : _instance(instance)
        {}
    protected:
        void update(float delta)
        {
            [_instance updatePrivate:delta];
        }
    protected:
        SEL _selector;
        id  _instance;
    };
}

@implementation Node

+ (Node*) create
{
    Node* node = [[Node alloc] init];
    [node autorelease];
    return node;
}

- (id) init
{
    self.inner = cocos2d::Node::create();
    [self initCommon];
    return self;
}

- (void) dealloc
{
    [_children release];
    [self unscheduleUpdate];
    [super dealloc];
}

- (void) initCommon
{
    INNER(n,Node);
    n->setOnEnterCallback([self] () { [self onEnter]; });
    n->setOnExitCallback([self] () { [self onExit]; });
}

- (void) setAnchorPoint :(CGPoint)anchor
{
    INNER(n,Node);
    n->setAnchorPoint(cocos2d::Vec2(anchor.x, anchor.y));
}

- (CGPoint) getAnchorPoint
{
    INNER(n,Node);
    auto ap = n->getAnchorPoint();
    return CGPointMake(ap.x, ap.y);
}

- (float) getRotation
{
    INNER(n,Node);
    return n->getRotation();
}

- (void) setRotation :(float)r
{
    INNER(n,Node);
    n->setRotation(r);
}

- (void) setOpacity :(float)a
{
    INNER(n,Node);
    n->setOpacity(a);
}

- (float) getOpacity
{
    INNER(n,Node);
    return n->getOpacity();
}

- (void) setPosition :(CGPoint)pos
{
    INNER(n,Node);
    n->setPosition(pos.x, pos.y);
}

- (void) setPosition :(float) x : (float) y
{
    INNER(n,Node);
    n->setPosition(cocos2d::Point(x, y));
}

- (CGPoint) getPosition
{
    INNER(n,Node);
    const cocos2d::Vec2& pos = n->getPosition();
    return CGPointMake(pos.x, pos.y);
}

- (void) setScaleX :(float)scaleX
{
    INNER(n,Node);
    n->setScaleX(scaleX);
}

- (void) setScaleY :(float)scaleY
{
    INNER(n,Node);
    n->setScaleY(scaleY);
}

- (void) setScaleZ :(float)scaleZ
{
    INNER(n,Node);
    n->setScaleZ(scaleZ);
}

- (float) getScaleX
{
    INNER(n,Node);
    return n->getScaleX();
}

- (float) getScaleY
{
    INNER(n,Node);
    return n->getScaleY();
}

- (float) getScaleZ
{
    INNER(n,Node);
    return n->getScaleZ();
}

- (void) setScale :(float)scale
{
    INNER(n,Node);
    n->setScale(scale);
}

- (float) getScale
{
    INNER(n,Node);
    return n->getScale();
}

- (void) setScale :(float)scaleX :(float)scaleY
{
    INNER(n,Node);
    n->setScale(scaleX, scaleY);
}

- (void) addChild:(Node*) child
{
    INNER(n,Node);
    [child retain];
    n->addChild(static_cast<cocos2d::Node*>(child.inner));
}

- (NSArray*) getChildren
{
    if (_children == nil)
        _children = [[NSMutableArray alloc] init];
    
    [_children removeAllObjects];
    
    auto n = (cocos2d::Node*)_inner;
    for (auto node : n->getChildren())
        [_children addObject:static_cast<Node*>(node->_scriptObject)];
    
    return _children;
}

- (Node*) getParent
{
    INNER(n, Node);
    auto parent = n->getParent();
    return parent != nullptr ? static_cast<Node*>(parent->_scriptObject) : nullptr;
}

- (void) removeAllChildren
{
    INNER(n, Node);
    n->removeAllChildren();
}

- (CGSize) getContentSize
{
    INNER(n,Node);
    auto size = n->getContentSize();
    return CGSizeMake(size.width, size.height);
}

- (void) setContentSize :(CGSize)size
{
    INNER(n,Node);
    n->setContentSize(cocos2d::Size(size.width, size.height));
}

- (void) scheduleUpdate :(tUpdateBlock)update
{
    _update = update;
    [_update retain];
    INNER(n,Node);
    auto uc = updateComponent::create(self);
    uc->setName("updateComponent");
    n->addComponent(uc);
    n->scheduleUpdate();
}

- (void) unscheduleUpdate
{
    INNER(n,Node);
    n->removeComponent("updateComponent");
    n->unscheduleUpdate();
    [_update release];
    _update = nil;
}

- (CGPoint) convertToNodeSpace :(CGPoint)worldPoint
{
    INNER(n,Node);
    auto np = n->convertToNodeSpace(cocos2d::Vec2(worldPoint.x, worldPoint.y));
    return CGPointMake(np.x, np.y);
}

- (CGPoint) convertToWorldSpace :(CGPoint)nodePoint
{
    INNER(n,Node);
    auto wp = n->convertToWorldSpace(cocos2d::Vec2(nodePoint.x, nodePoint.y));
    return CGPointMake(wp.x, wp.y);
}

- (Action*) runAction :(Action*)action
{
    INNER(n,Node);
    auto r = n->runAction(static_cast<cocos2d::Action*>(action.inner));
    SET_OUTER(r,Action);
    return GET_OUTER(r,Action);
}

- (void) stopAction :(Action*)action
{
    INNER(n,Node);
    n->stopAction(static_cast<cocos2d::Action*>(action.inner));
}

- (void) stopAllActions
{
    INNER(n,Node);
    n->stopAllActions();
}

- (void) onEnter
{
    // does nothing
}

- (void) onExit
{
    // does nothing
}

- (void) removeFromParentAndCleanup :(bool)cleanup
{
    INNER(n,Node);
    n->removeFromParentAndCleanup(cleanup);
}

//
// Private Methods
//

- (void) updatePrivate :(float)delta
{
    if (nil != _update)
        _update(delta);
}
@end
