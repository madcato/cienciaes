//
//  statusAPITest.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSLibrary/OSWebQuery.h"
#import "CEWebObjectFactory.h"
#import "AppDelegate.h"

@interface statusAPITest : XCTestCase

@property (nonatomic, strong) CEStatusEndpoint* endpoint;

@end

@implementation statusAPITest

- (void)setUp {
    [super setUp];
    _endpoint = [[CEWebObjectFactory new] createStatusEndpointObject];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDownload {
    XCTestExpectation* expectation = [self expectationWithDescription:@"status"];
    
    [_endpoint resume:^(id result, NSError *error) {
        XCTAssertNotNil(APPDATA.status);
        XCTAssertNotNil(APPDATA.status.state);

        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


@end
