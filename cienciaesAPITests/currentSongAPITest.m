//
//  currentSongAPITest.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSLibrary/OSWebQuery.h"
#import "CEWebObjectFactory.h"
#import "AppDelegate.h"

@interface currentSongAPITest : XCTestCase

@property (nonatomic, strong) CECurrentSongEndpoint* endpoint;

@end

@implementation currentSongAPITest

- (void)setUp {
    [super setUp];
    _endpoint = [[CEWebObjectFactory new] createCurrentEndpointObject];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDownload {
    XCTestExpectation* expectation = [self expectationWithDescription:@"currentSong"];

    [_endpoint resume:^(id result, NSError *error) {
        XCTAssertNotNil(APPDATA.current);
        XCTAssertNotNil(APPDATA.current.type);
        XCTAssertNotNil(APPDATA.current.podcast);
        XCTAssertNotNil(APPDATA.current.podcast.website);
        XCTAssertNotNil(APPDATA.current.podcast.twitter);
        XCTAssertNotNil(APPDATA.current.podcast.name);
        XCTAssertNotNil(APPDATA.current.podcast.podcastDescription);
        XCTAssertNotNil(APPDATA.current.cover);
        XCTAssertNotNil(APPDATA.current.title);
        
        [expectation fulfill];
    }];
 
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
