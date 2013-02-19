//
//  weatherApp - SampleTest.m
//  Copyright 2013 BKTurley. All rights reserved.
//
//  Created by: BKTurley
//

#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>

@interface SampleTest : GHTestCase
{
    
}
@end

@implementation SampleTest

- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}

- (void)testExample
{
    GHFail(@"Unit tests are not implemented yet in SampleTest.");
}

// simple test to ensure building, linking, 
// and running test case works in the project
- (void)testOCMockPass {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    GHAssertEqualObjects(@"mocktest", returnValue, 
                         @"Should have returned the expected string.");
}

- (void)testOCMockFail {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    GHAssertEqualObjects([mock lowercaseString],
                         returnValue, @"Should have returned the expected string.");
}

@end
