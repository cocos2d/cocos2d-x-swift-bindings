
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

//  AudioEngine.h
//  Created by Justin Graham on 7/3/14.

#include "stdint.h"

@interface AudioEngine : NSObject
+ (void) preloadBackgroundMusic :(NSString*)path;
+ (void) playBackgroundMusic :(NSString*)path :(bool)loop;
+ (void) stopBackgroundMusic;
+ (void) pauseBackgroundMusic;
+ (void) resumeBackgroundMusic;
+ (void) rewindBackgroundMusic;
+ (bool) isBackgroundMusicPlaying;
+ (void) setBackgroundMusicVolume :(float)volume;
+ (float) getEffectsVolume;
+ (void) setEffectsVolume :(float)volume;
+ (uint32_t) playEffect :(NSString*)path :(bool)loop :(float)pitch :(float)pan :(float)gain;
+ (void) pauseEffect :(uint32_t)id;
+ (void) pauseAllEffects;
+ (void) resumeEffect :(uint32_t)id;
+ (void) resumeAllEffects;
+ (void) stopEffect :(uint32_t)id;
+ (void) stopAllEffects;
+ (void) preloadEffect :(NSString*)path;
+ (void) unloadEffect :(NSString*)path;
@end
