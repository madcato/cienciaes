//
//  CEDownloadManager.m
//  cienciaes
//
//  Created by Daniel Vela on 02/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CEDownloadManager.h"
#import "OSLibrary/OSWebQuery.h"
#import "CECurrentSongEndpoint.h"
#import "CENextSongEndpoint.h"
#import "CEWebObjectFactory.h"
#import "AppDelegate.h"

@interface CEDownloadManager ()

@property (nonatomic, strong) CECurrentSongEndpoint* currentSongEndpoint;
@property (nonatomic, strong) CENextSongEndpoint* nextSongEndpoint;
@property (nonatomic, strong) CEStatusEndpoint* statusEndpoint;
@property (nonatomic, strong) CELiveEndpoint* liveEndpoint;

@end

@implementation CEDownloadManager

- (void)start {
    [self donwloadSongInfo];
    [self configureObservers];
}

- (void)configureObservers {
    [APPDATA addObserver:self
              forKeyPath:NSStringFromSelector(@selector(status))
                 options:NSKeyValueObservingOptionOld
                 context:nil];

    [APPDATA addObserver:self
              forKeyPath:NSStringFromSelector(@selector(live))
                 options:NSKeyValueObservingOptionOld
                 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (APPDATA.status.live == NO) {
            [self downloadCurrentSongInfo];
            [self downloadNextSongInfo];
            NSUInteger delay = APPDATA.status.totalTime - APPDATA.status.currentTime;
            NSLog(@"Perform download after: %lu seconds", (unsigned long)delay);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSelector:@selector(donwloadSongInfo) withObject:nil afterDelay:delay];
            });
        } else {
            [self downloadLiveInfo];
        }
    }
    
    if ([keyPath isEqualToString:@"live"]) {
        
    }
}

#pragma mark - Downloaders
    
- (void)donwloadSongInfo {
    APPDATA.current = APPDATA.next;
    APPDATA.next = nil;
    [self downloadStatusInfo];
}

- (void)downloadCurrentSongInfo {
    CEWebObjectFactory* factory = [[CEWebObjectFactory alloc] init];
    self.currentSongEndpoint = [factory createCurrentEndpointObject];

    [self.currentSongEndpoint resume:^(id result, NSError *error) {
        if (result == nil) {
            // Retry after a second
            [NSThread sleepForTimeInterval:2];
            [self downloadCurrentSongInfo];
        }
    }];
}

- (void)downloadNextSongInfo {
    CEWebObjectFactory* factory = [[CEWebObjectFactory alloc] init];
    self.nextSongEndpoint = [factory createNextEndpointObject];
    
    [self.nextSongEndpoint resume:^(id result, NSError *error) {
        if (result == nil) {
            // Retry after a second
            [NSThread sleepForTimeInterval:2];
            [self downloadNextSongInfo];
        }
    }];
}

- (void)downloadStatusInfo {
    CEWebObjectFactory* factory = [[CEWebObjectFactory alloc] init];
    self.statusEndpoint = [factory createStatusEndpointObject];
    
    [self.statusEndpoint resume:^(id result, NSError *error) {
        if (result == nil) {
            // Retry after a second
            [NSThread sleepForTimeInterval:2];
            [self downloadStatusInfo];
        }
    }];
}

- (void)downloadLiveInfo {
    CEWebObjectFactory* factory = [[CEWebObjectFactory alloc] init];
    self.liveEndpoint = [factory createLiveEndpointObject];
    
    [self.liveEndpoint resume:^(id result, NSError *error) {
        [NSThread sleepForTimeInterval:10];
        [self downloadStatusInfo];
    }];
}

@end
