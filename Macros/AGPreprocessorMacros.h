//
//  AGPreprocessorMacros.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Preprocessor macros from the Nimbus Project by Jeff Verkoeyen
 *	Reference: https://github.com/jverkoey/nimbus
 */ 

#define FIX_CATEGORY_BUG(name) @interface FIX_CATEGORY_BUG_##name @end \
@implementation FIX_CATEGORY_BUG_##name @end

#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }