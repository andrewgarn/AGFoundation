//
//  SKProduct+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <StoreKit/StoreKit.h>

/** A collection of category extensions for `SKProduct` */
@interface SKProduct (AGCategory)

/** Returns the localized `SKProduct` price.
 @return The localized `SKProduct` price.
*/ 
- (NSString *)localizedPrice;

@end