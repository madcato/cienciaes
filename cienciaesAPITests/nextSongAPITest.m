//
//  nextSongAPITest.m
//  cienciaes
//
//  Created by Daniel Vela on 30/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSLibrary/OSWebQuery.h"
#import "CEWebObjectFactory.h"
#import "AppDelegate.h"

@interface nextSongAPITest : XCTestCase

@property (nonatomic, strong) CENextSongEndpoint* endpoint;

@end

@implementation nextSongAPITest

- (void)setUp {
    [super setUp];
    _endpoint = [[CEWebObjectFactory new] createNextEndpointObject];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDownload {
    XCTestExpectation* expectation = [self expectationWithDescription:@"nextSong"];
    
    [_endpoint resume:^(id result, NSError *error) {
        XCTAssertNotNil(APPDATA.next);
        XCTAssertNotNil(APPDATA.next.type);
        XCTAssertNotNil(APPDATA.next.podcast);
        XCTAssertNotNil(APPDATA.next.podcast.website);
        XCTAssertNotNil(APPDATA.next.podcast.twitter);
        XCTAssertNotNil(APPDATA.next.podcast.name);
        XCTAssertNotNil(APPDATA.next.podcast.podcastDescription);
        XCTAssertNotNil(APPDATA.next.cover);
        XCTAssertNotNil(APPDATA.next.title);
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
