//
//  AGSynthesizeSingleton.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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