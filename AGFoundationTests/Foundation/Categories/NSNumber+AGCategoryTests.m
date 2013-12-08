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

- (void)testHumanReadableBytes
{
    NSNumber *bytes = [NSNumber numberWithUnsignedLongLong:1073741824];
    NSString *humanReadableBytes = [bytes humanReadableBytes_AG];
    XCTAssertTrue([humanReadableBytes isEqualToString:@"1 GB"], @"Byte description incorrect");
    
    bytes = [NSNumber numberWithUnsignedLongLong:1099511627776];
    humanReadableBytes = [bytes humanReadableBytes_AG];
    XCTAssertTrue([humanReadableBytes isEqualToString:@"1 TB"], @"Byte description incorrect");
}

@end