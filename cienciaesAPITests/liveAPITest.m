//
//  liveAPITest.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSLibrary/OSWebQuery.h"
#import "CEWebObjectFactory.h"
#import "AppDelegate.h"

@interface liveAPITest : XCTestCase

@property (nonatomic, strong) CELiveEndpoint* endpoint;

@end

@implementation liveAPITest

- (void)setUp {
    [super setUp];
    _endpoint = [[CEWebObjectFactory new] createLiveEndpointObject];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDownload {
    XCTestExpectation* expectation = [self expectationWithDescription:@"live"];
    
    [_endpoint resume:^(id result, NSError *error) {
        XCTAssertNotNil(APPDATA.live);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
