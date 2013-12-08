//
//  NSString+AGCategoryTests.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSString_AGCategoryTests : XCTestCase

- (void)testContainsString;
- (void)testStringBetweenStringAndString;

- (void)testReversedString;

- (void)testIsValidEmailAddress;

- (void)testMD5Hash;
- (void)testSHA1Hash;
- (void)testSHA256Hash;
- (void)testSHA512Hash;

@end