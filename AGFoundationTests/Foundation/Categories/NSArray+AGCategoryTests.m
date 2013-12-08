//
//  NSArray+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSArray+AGCategoryTests.h"
#import "NSArray+AGCategory.h"

@interface NSArray_AGCategoryTests ()
@property (nonatomic, strong) NSArray *testArray;
@end

@implementation NSArray_AGCategoryTests

#pragma mark - Setup/Teardown

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.testArray = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", nil];
}

- (void)tearDown
{
    // Tear-down code here.
    self.testArray = nil;
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testFirstObject
{
    XCTAssertTrue([@"one" isEqualToString:[self.testArray firstObject_AG]], @"First object incorrect");
    XCTAssertNil([[[NSArray alloc] init] firstObject_AG], @"First object should be nil");
}

- (void)testObjectAtIndex
{
    XCTAssertNotNil([self.testArray objectAtIndex_AG:1], @"Second object should not be nil");
    XCTAssertNil([self.testArray objectAtIndex_AG:4], @"Fifth object should be nil");
}

- (void)testReversedArray
{
    NSArray *array = [self.testArray reversedArray_AG];
    XCTAssertTrue([[array objectAtIndex:0] isEqualToString:@"four"], @"Reversed array test failed");
}

@end