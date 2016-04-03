//
//  CELiveEndpoint.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CELiveEndpoint.h"
#import "Status+JSON.h"
#import "AppDelegate.h"
#import "Song+JSON.h"
#import "CEWebInterface.h"

@implementation CELiveEndpoint

- (void)resume:(OSWebQueryHandler)handler {
    super.interface.basePath = @"api/live/";
    [super resume:^(id result, NSError *error) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* data = (NSDictionary*)result;
            Song* song = [[Song alloc] initWithDictionary:data];
            song.cover = [CEWebInterface imageURLForLiveCover:song.cover];
            APPDATA.current = song;
            APPDATA.next;
        } else {
            NSLog(@"ERROR: api/live/ doesn't return a JSON dictionary");
        }
        handler(result,error);
    }];
}

@end
