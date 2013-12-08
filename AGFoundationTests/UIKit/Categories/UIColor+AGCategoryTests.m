//
//  UIColor+AGCategoryTests.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIColor+AGCategoryTests.h"
#import "UIColor+AGCategory.h"

@interface UIColor_AGCategoryTests ()
@property (nonatomic, strong) UIColor *testColor;
@end

@implementation UIColor_AGCategoryTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.testColor = [UIColor colorWithRed:0.1f green:0.2f blue:0.3f alpha:0.4f];
}

#pragma mark - Teardown

- (void)tearDown
{
    // Tear-down code here.
    self.testColor = nil;
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testRedComponent
{
    XCTAssertTrue([self.testColor redComponent_AG] == 0.1f, @"Red component test failed.");
}

- (void)testGreenComponent
{
    XCTAssertTrue([self.testColor greenComponent_AG] == 0.2f, @"Green component test failed.");
}

- (void)testBlueComponent
{
    XCTAssertTrue([self.testColor blueComponent_AG] == 0.3f, @"Blue component test failed.");
}

- (void)testAlphaComponent
{
    XCTAssertTrue([self.testColor alphaComponent_AG] == 0.4f, @"Alpha component test failed.");
}

@end