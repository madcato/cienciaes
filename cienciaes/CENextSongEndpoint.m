//
//  CENextSongEndpoint.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CENextSongEndpoint.h"
#import "AppDelegate.h"
#import "Song+JSON.h"
#import "CEWebInterface.h"

@implementation CENextSongEndpoint

- (void)resume:(OSWebQueryHandler)handler {
    super.interface.basePath = @"api/next/";
    [super resume:^(id result, NSError *error) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* data = (NSDictionary*)result;
            Song* song = [[Song alloc] initWithDictionary:data];
            song.cover = [CEWebInterface imageURLForCover:song.cover];
            APPDATA.next = song;
        } else {
            NSLog(@"ERROR: api/next/ doesn't return a JSON dictionary");
        }
        handler(result,error);
    }];
}

@end
