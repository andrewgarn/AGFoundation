//
//  PurchaseManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "PurchaseManager.h"

@implementation PurchaseManager
@synthesize productIdentifierSet = _productIdentifierSet;
@synthesize productArray = _productArray;

#pragma mark -

- (id)init
{
    if ((self = [super init]))
    {
        [self performSelector:@selector(requestProducts) withObject:nil afterDelay:0.5];
    }
    return self;
}

#pragma mark -

- (void)requestProducts
{
	_productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifierSet];
    [_productsRequest setDelegate:self];
    [_productsRequest start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response 
{
    _productArray = response.products;
    _successfullyRetrievedProducts = YES;
}

#pragma mark -

+ (NSArray *)products
{
    return [[PurchaseManager sharedManager] productArray];
}

+ (SKProduct *)productWithIdentifier:(NSString *)identifier
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == '%@'", identifier];
    NSArray *filteredArray = [[PurchaseManager products] filteredArrayUsingPredicate:predicate];
    if ([filteredArray count] > 0)
    {
        return [filteredArray objectAtIndex:0];
    }
    return nil;
}
            
#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_IMPLEMENTATION(PurchaseManager, sharedManager);

@end