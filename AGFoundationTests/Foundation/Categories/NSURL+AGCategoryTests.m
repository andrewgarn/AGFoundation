//
//  NSURL+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 25/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSURL+AGCategoryTests.h"
#import "NSURL+AGCategory.h"

@implementation NSURL_AGCategoryTests

#pragma mark - Tests

- (void)testIsEqualToURL
{
    NSURL *baseURL = [NSURL URLWithString:@"http://github.com"];
    NSURL *relativeURL = [NSURL URLWithString:@"andrewgarn/AGFoundation" relativeToURL:baseURL];
    NSURL *absoluteURL = [NSURL URLWithString:@"http://github.com/andrewgarn/AGFoundation" relativeToURL:nil];
    XCTAssertTrue([relativeURL isEqualToURL_AG:absoluteURL], @"NSURL isEqualToURL test failed");
}

@end