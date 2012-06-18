//
//  PurchaseManager.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import "AGSynthesizeSingleton.h"

@interface PurchaseManager : NSObject <SKProductsRequestDelegate>
{
    SKProductsRequest *_productsRequest;
    BOOL _successfullyRetrievedProducts;
}

@property (nonatomic, strong) NSSet *productIdentifierSet;
@property (nonatomic, strong) NSArray *productArray;

+ (NSArray *)products;
+ (SKProduct *)productWithIdentifier:(NSString *)identifier;

#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_INTERFACE(PurchaseManager, sharedManager);

@end