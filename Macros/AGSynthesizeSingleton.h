//
//  AGSynthesizeSingleton.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/**
    Singleton interface method macro
*/
#define SYNTHESIZE_SINGLETON_FOR_INTERFACE(CLASSNAME, ACCESSOR) \
+ (CLASSNAME *)ACCESSOR;

/**
    Singleton implementation method macro
*/
#if __has_feature(objc_arc)

#define SYNTHESIZE_SINGLETON_FOR_IMPLEMENTATION(CLASSNAME, ACCESSOR) \
\
__strong static CLASSNAME *__##ACCESSOR = nil; \
\
+ (CLASSNAME *)ACCESSOR \
{ \
    static dispatch_once_t pred; \
    dispatch_once(&pred, ^{ \
        __##ACCESSOR = [[self alloc] init]; \
    });    \
    return __##ACCESSOR; \
} \

#else

#define SYNTHESIZE_SINGLETON_FOR_IMPLEMENTATION(CLASSNAME, ACCESSOR) \
\
static CLASSNAME *__##ACCESSOR = nil; \
\
+ (CLASSNAME *)ACCESSOR \
{ \
	@synchronized(self) \
	{ \
		if (__##ACCESSOR == nil) \
		{ \
			__##ACCESSOR = [[self alloc] init]; \
		} \
	} \
\
return __##ACCESSOR; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
	@synchronized(self) \
	{ \
		if (__##ACCESSOR == nil) \
		{ \
			__##ACCESSOR = [super allocWithZone:zone]; \
			return __##ACCESSOR; \
		} \
	} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
	return self; \
} \
\
- (id)retain \
{ \
	return self; \
} \
\
- (NSUInteger)retainCount \
{ \
	return NSUIntegerMax; \
} \
\
-(oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
	return self; \
}

#endif