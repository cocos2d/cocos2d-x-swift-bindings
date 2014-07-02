
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

//  Console.mm
//  Created by Justin Graham on 6/30/14.

#import "Console.h"
#include "CCConsole.h"

@implementation Console
- (void) listenOnTCP :(int)port
{
    INNER(c,Console);
    c->listenOnTCP(port);
}

- (void) log :(NSString*)text
{
    INNER(c,Console);
    c->log([text UTF8String]);
    c->log("\n");
}

- (void) addCommand :(NSString*)name :(NSString*)help :(commandBlock)command
{
    INNER(c,Console);
    [command retain];
    auto lambda = [command](int i, const std::string& s)
    {
        command(i, [[NSString alloc] initWithUTF8String:s.c_str()]);
    };
    cocos2d::Console::Command m = {[name UTF8String], [help UTF8String], lambda};
    c->addCommand(m);
}
@end
