//
//  NSDate+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSDate+AGCategoryTests.h"
#import "NSDate+AGCategory.h"

@interface NSDate_AGCategoryTests ()
@property (nonatomic, strong) NSDate *testDate;
@end

@implementation NSDate_AGCategoryTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.testDate = [NSDate dateWithTimeIntervalSince1970:1355314332]; // 12th Dec 2012 12:12:12 GMT
}

#pragma mark - Teardown

- (void)tearDown
{
    // Tear-down code here.
    self.testDate = nil;
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testIsToday
{
    STAssertTrue([[NSDate date] isToday_AG], @"Date isToday test failed.");
    STAssertFalse([self.testDate isToday_AG], @"Date isToday test failed.");
}

@end