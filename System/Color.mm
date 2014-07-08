//
//  Color.mm
//  SwiftTetris
//
//  Created by Justin Graham on 7/7/14.
//
//

#import "Color.h"

@implementation Color4B
+ (id) createWithRGBA :(unsigned char)red :(unsigned char)green :(unsigned char)blue :(unsigned char)alpha
{
    Color4B* color = [Color4B new];
    color.r = red;
    color.g = green;
    color.b = blue;
    color.a = alpha;
    return color;
}

+ (id) createWithBlack
{
    Color4B* color = [Color4B new];
    color.r = 0;
    color.g = 0;
    color.b = 0;
    color.a = 255;
    return color;
}
@end