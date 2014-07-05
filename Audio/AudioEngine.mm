//
//  AudioEngine.m
//  swiftress
//
//  Created by Justin Graham on 7/3/14.
//
//

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

- (uint32_t) playEffect :(NSString*)path :(bool)loop :(float)pan :(float)gain
{
    INNERNS(ae,CocosDenshion::SimpleAudioEngine);
    return ae->playEffect([path UTF8String], loop, pan, gain);
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
