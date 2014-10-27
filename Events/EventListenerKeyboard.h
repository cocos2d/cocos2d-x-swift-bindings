
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

//  EventListenerKeyboard.h
//  Created by Justin Graham on 6/21/14.

#import "EventListener.h"

@class Event;

@interface EventListenerKeyboard : EventListener
typedef NS_ENUM(int, KeyCode)
{
    KeyCodeNONE,
    KeyCodePAUSE,
    KeyCodeSCROLL_LOCK,
    KeyCodePRINT,
    KeyCodeSYSREQ,
    KeyCodeBREAK,
    KeyCodeESCAPE,
    KeyCodeBACKSPACE,
    KeyCodeTAB,
    KeyCodeBACK_TAB,
    KeyCodeRETURN,
    KeyCodeCAPS_LOCK,
    KeyCodeSHIFT,
    KeyCodeCTRL,
    KeyCodeALT,
    KeyCodeMENU,
    KeyCodeHYPER,
    KeyCodeINSERT,
    KeyCodeHOME,
    KeyCodePG_UP,
    KeyCodeDELETE,
    KeyCodeEND,
    KeyCodePG_DOWN,
    KeyCodeLEFT_ARROW,
    KeyCodeRIGHT_ARROW,
    KeyCodeUP_ARROW,
    KeyCodeDOWN_ARROW,
    KeyCodeNUM_LOCK,
    KeyCodeKP_PLUS,
    KeyCodeKP_MINUS,
    KeyCodeKP_MULTIPLY,
    KeyCodeKP_DIVIDE,
    KeyCodeKP_ENTER,
    KeyCodeKP_HOME,
    KeyCodeKP_UP,
    KeyCodeKP_PG_UP,
    KeyCodeKP_LEFT,
    KeyCodeKP_FIVE,
    KeyCodeKP_RIGHT,
    KeyCodeKP_END,
    KeyCodeKP_DOWN,
    KeyCodeKP_PG_DOWN,
    KeyCodeKP_INSERT,
    KeyCodeKP_DELETE,
    KeyCodeF1,
    KeyCodeF2,
    KeyCodeF3,
    KeyCodeF4,
    KeyCodeF5,
    KeyCodeF6,
    KeyCodeF7,
    KeyCodeF8,
    KeyCodeF9,
    KeyCodeF10,
    KeyCodeF11,
    KeyCodeF12,
    KeyCodeSPACE,
    KeyCodeEXCLAM,
    KeyCodeQUOTE,
    KeyCodeNUMBER,
    KeyCodeDOLLAR,
    KeyCodePERCENT,
    KeyCodeCIRCUMFLEX,
    KeyCodeAMPERSAND,
    KeyCodeAPOSTROPHE,
    KeyCodeLEFT_PARENTHESIS,
    KeyCodeRIGHT_PARENTHESIS,
    KeyCodeASTERISK,
    KeyCodePLUS,
    KeyCodeCOMMA,
    KeyCodeMINUS,
    KeyCodePERIOD,
    KeyCodeSLASH,
    KeyCode0,
    KeyCode1,
    KeyCode2,
    KeyCode3,
    KeyCode4,
    KeyCode5,
    KeyCode6,
    KeyCode7,
    KeyCode8,
    KeyCode9,
    KeyCodeCOLON,
    KeyCodeSEMICOLON,
    KeyCodeLESS_THAN,
    KeyCodeEQUAL,
    KeyCodeGREATER_THAN,
    KeyCodeQUESTION,
    KeyCodeAT,
    KeyCodeCAPITAL_A,
    KeyCodeCAPITAL_B,
    KeyCodeCAPITAL_C,
    KeyCodeCAPITAL_D,
    KeyCodeCAPITAL_E,
    KeyCodeCAPITAL_F,
    KeyCodeCAPITAL_G,
    KeyCodeCAPITAL_H,
    KeyCodeCAPITAL_I,
    KeyCodeCAPITAL_J,
    KeyCodeCAPITAL_K,
    KeyCodeCAPITAL_L,
    KeyCodeCAPITAL_M,
    KeyCodeCAPITAL_N,
    KeyCodeCAPITAL_O,
    KeyCodeCAPITAL_P,
    KeyCodeCAPITAL_Q,
    KeyCodeCAPITAL_R,
    KeyCodeCAPITAL_S,
    KeyCodeCAPITAL_T,
    KeyCodeCAPITAL_U,
    KeyCodeCAPITAL_V,
    KeyCodeCAPITAL_W,
    KeyCodeCAPITAL_X,
    KeyCodeCAPITAL_Y,
    KeyCodeCAPITAL_Z,
    KeyCodeLEFT_BRACKET,
    KeyCodeBACK_SLASH,
    KeyCodeRIGHT_BRACKET,
    KeyCodeUNDERSCORE,
    KeyCodeGRAVE,
    KeyCodeA,
    KeyCodeB,
    KeyCodeC,
    KeyCodeD,
    KeyCodeE,
    KeyCodeF,
    KeyCodeG,
    KeyCodeH,
    KeyCodeI,
    KeyCodeJ,
    KeyCodeK,
    KeyCodeL,
    KeyCodeM,
    KeyCodeN,
    KeyCodeO,
    KeyCodeP,
    KeyCodeQ,
    KeyCodeR,
    KeyCodeS,
    KeyCodeT,
    KeyCodeU,
    KeyCodeV,
    KeyCodeW,
    KeyCodeX,
    KeyCodeY,
    KeyCodeZ,
    KeyCodeLEFT_BRACE,
    KeyCodeBAR,
    KeyCodeRIGHT_BRACE,
    KeyCodeTILDE,
    KeyCodeEURO,
    KeyCodePOUND,
    KeyCodeYEN,
    KeyCodeMIDDLE_DOT,
    KeyCodeSEARCH,
    KeyCodeDPAD_LEFT,
    KeyCodeDPAD_RIGHT,
    KeyCodeDPAD_UP,
    KeyCodeDPAD_DOWN,
    KeyCodeDPAD_CENTER,
    KeyCodeENTER,
    KeyCodePLAY,
};

typedef void(^voidKeyBlock)(KeyCode, Event*);

@property (nonatomic,copy) voidKeyBlock onKeyPressed;
@property (nonatomic,copy) voidKeyBlock onKeyReleased;

- (id) init;
+ (EventListenerKeyboard*) create;
- (bool) checkAvailable;
- (EventListenerKeyboard*) clone;
@end

