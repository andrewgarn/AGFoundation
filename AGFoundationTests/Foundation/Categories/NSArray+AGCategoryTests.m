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

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.testArray = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", nil];
}

#pragma mark - Teardown

- (void)tearDown
{
    // Tear-down code here.
    self.testArray = nil;
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testFirstObject
{
    STAssertTrue([@"one" isEqualToString:[self.testArray firstObject_AG]], @"First object incorrect");
    STAssertNil([[[NSArray alloc] init] firstObject_AG], @"First object should be nil");
}

- (void)testObjectAtIndex
{
    STAssertNotNil([self.testArray objectAtIndex_AG:1], @"Second object should not be nil");
    STAssertNil([self.testArray objectAtIndex_AG:4], @"Fifth object should be nil");
}

@end