//
//  NSString+AGCategoryTests.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface NSString_AGCategoryTests : SenTestCase

- (void)testReversedString;

- (void)testMD5Hash;
- (void)testSHA1Hash;
- (void)testSHA256Hash;
- (void)testSHA512Hash;

@end