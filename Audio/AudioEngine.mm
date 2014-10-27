
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

//  AudioEngine.mm
//  Created by Justin Graham on 7/3/14.

#import "AudioEngine.h"
#include "SimpleAudioEngine.h"

@implementation AudioEngine
+ (void) preloadBackgroundMusic :(NSString*)path
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->preloadBackgroundMusic([path UTF8String]);
}

+ (void) playBackgroundMusic :(NSString*)path :(bool)loop
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->playBackgroundMusic([path UTF8String], loop);
}

+ (void) stopBackgroundMusic
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->stopBackgroundMusic();
}

+ (void) pauseBackgroundMusic
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->pauseBackgroundMusic();
}

+ (void) resumeBackgroundMusic
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->resumeBackgroundMusic();
}

+ (void) rewindBackgroundMusic
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->rewindBackgroundMusic();
}

+ (bool) isBackgroundMusicPlaying
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    return ae->isBackgroundMusicPlaying();
}

+ (void) setBackgroundMusicVolume :(float)volume
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->setBackgroundMusicVolume(volume);
}

+ (float) getEffectsVolume
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    return ae->getEffectsVolume();
}

+ (void) setEffectsVolume :(float)volume
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->setEffectsVolume(volume);
}

+ (uint32_t) playEffect :(NSString*)path :(bool)loop :(float)pitch :(float)pan :(float)gain
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    return ae->playEffect([path UTF8String], loop, pitch, pan, gain);
}

+ (void) pauseEffect :(uint32_t)id
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->pauseEffect(id);
}

+ (void) pauseAllEffects
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->pauseAllEffects();
}

+ (void) resumeEffect :(uint32_t)id
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->resumeEffect(id);
}

+ (void) resumeAllEffects
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->resumeAllEffects();
}

+ (void) stopEffect :(uint32_t)id
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->stopEffect(id);
}

+ (void) stopAllEffects
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->stopAllEffects();
}

+ (void) preloadEffect :(NSString*)path
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->preloadEffect([path UTF8String]);
}

+ (void) unloadEffect :(NSString*)path
{
    auto ae = CocosDenshion::SimpleAudioEngine::getInstance();
    ae->unloadEffect([path UTF8String]);
}
@end
