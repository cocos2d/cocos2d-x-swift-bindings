
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
+ (AudioEngine*) getInstance
{
    static AudioEngine* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.inner = CocosDenshion::SimpleAudioEngine::getInstance();
    });
    return instance;
}

- (void) preloadBackgroundMusic :(NSString*)path
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->preloadBackgroundMusic([path UTF8String]);
}

- (void) playBackgroundMusic :(NSString*)path :(bool)loop
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->playBackgroundMusic([path UTF8String], loop);
}

- (void) stopBackgroundMusic
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->stopBackgroundMusic();
}

- (void) pauseBackgroundMusic
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->pauseBackgroundMusic();
}

- (void) resumeBackgroundMusic
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->resumeBackgroundMusic();
}

- (void) rewindBackgroundMusic
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->rewindBackgroundMusic();
}

- (bool) isBackgroundMusicPlaying
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    return ae->isBackgroundMusicPlaying();
}

- (void) setBackgroundMusicVolume :(float)volume
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->setBackgroundMusicVolume(volume);
}

- (float) getEffectsVolume
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    return ae->getEffectsVolume();
}

- (void) setEffectsVolume :(float)volume
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->setEffectsVolume(volume);
}

- (uint32_t) playEffect :(NSString*)path :(bool)loop :(float)pitch :(float)pan :(float)gain
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    return ae->playEffect([path UTF8String], loop, pitch, pan, gain);
}

- (void) pauseEffect :(uint32_t)id
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->pauseEffect(id);
}

- (void) pauseAllEffects
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->pauseAllEffects();
}

- (void) resumeEffect :(uint32_t)id
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->resumeEffect(id);
}

- (void) resumeAllEffects
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->resumeAllEffects();
}

- (void) stopEffect :(uint32_t)id
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->stopEffect(id);
}

- (void) stopAllEffects
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->stopAllEffects();
}

- (void) preloadEffect :(NSString*)path
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->preloadEffect([path UTF8String]);
}

- (void) unloadEffect :(NSString*)path
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    ae->unloadEffect([path UTF8String]);
}
@end
