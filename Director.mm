
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

//  Director.mm
//  Created by Justin Graham on 6/17/14.

#import "Director.h"
#import "Scene.h"
#import "Console.h"
#include "CCDirector.h"
#include "CCScene.h"
#include "CCConsole.h"

@implementation Director
+ (Director*) getInstance
{
    static Director* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.inner = cocos2d::Director::getInstance();

    });
    return instance;
}

- (void) runWithScene:(Scene*)scene
{
    INNER(director,Director);
    [scene retain];
    director->runWithScene(static_cast<cocos2d::Scene*>(scene.inner));
}

- (void) pushScene:(Scene*)scene
{
    INNER(director,Director);
    [scene retain];
    director->pushScene(static_cast<cocos2d::Scene*>(scene.inner));
}

- (void) popScene
{
    INNER(director,Director);
    auto scene = director->getRunningScene();
    auto s = GET_OUTER(scene,Scene);
    [s release];
    director->popScene();
}

- (CGSize) getWinSize
{
    INNER(director,Director);
    auto size = director->getWinSize();
    return CGSizeMake(size.width, size.height);
}

- (EventDispatcher*) eventDispatcher
{
    if (nil == _eventDispatcher)
        _eventDispatcher = [[EventDispatcher alloc] init];
    return _eventDispatcher;
}

- (Console*) console
{
    if (nil == _console)
    {
        INNER(director,Director);
        auto console = director->getConsole();
        SET_OUTER(console, Console);
        _console = GET_OUTER(console, Console);
        _console.inner = console;
    }
    return _console;
}
@end

