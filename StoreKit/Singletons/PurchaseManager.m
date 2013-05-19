//
//  PurchaseManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
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

#import "PurchaseManager.h"

@interface PurchaseManager ()
@property (nonatomic, copy) AGPurchaseManagerProductRequestResponseBlock productRequestResponseBlock;
@end

#pragma mark -

@implementation PurchaseManager

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        [self performSelector:@selector(requestProducts) withObject:nil afterDelay:0.5];
    }
    return self;
}

#pragma mark -

+ (void)requestProductsWithIdentifiers:(NSSet *)identifiers responseBlock:(AGPurchaseManagerProductRequestResponseBlock)block
{
    [[PurchaseManager sharedManager] setProductRequestResponseBlock:block];
    [[PurchaseManager sharedManager] requestProductsWithIdentifiers:identifiers];
}

#pragma mark -

- (void)requestProductsWithIdentifiers:(NSSet *)productIdentifiers
{
	self.productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    self.productsRequest.delegate = self;
    
    [self.productsRequest start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response 
{
    if (self.productRequestResponseBlock) {
        self.productRequestResponseBlock(response.products, response.invalidProductIdentifiers);
    }
}

#pragma mark -

+ (BOOL)canMakePayments
{
    Class class = NSClassFromString(@"SKPaymentQueue");
    if (class) return [(id)class canMakePayments];
    return NO;
}
            
#pragma mark - Singleton

+ (PurchaseManager *)sharedManager
{
    static PurchaseManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[PurchaseManager alloc] init];
    });
    return sharedManager;
}

@end