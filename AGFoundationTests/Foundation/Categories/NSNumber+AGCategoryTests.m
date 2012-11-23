//
//  NSNumber+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSNumber+AGCategoryTests.h"
#import "NSNumber+AGCategory.h"

@implementation NSNumber_AGCategoryTests

#pragma mark - Tests

- (void)testFormattedBytes
{
    NSNumber *bytes = [NSNumber numberWithUnsignedLongLong:1073741824];
    NSString *formattedBytes = [bytes formattedBytes_AG];
    STAssertTrue([formattedBytes isEqualToString:@"1 GB"], @"Formatted byte description incorrect");
    
    bytes = [NSNumber numberWithUnsignedLongLong:1099511627776];
    formattedBytes = [bytes formattedBytes_AG];
    STAssertTrue([formattedBytes isEqualToString:@"1 TB"], @"Formatted byte description incorrect");
}

@end