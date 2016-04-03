//
//  CECurrentSongEndpoint.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CECurrentSongEndpoint.h"
#import "AppDelegate.h"
#import "Song+JSON.h"
#import "CEWebInterface.h"

@implementation CECurrentSongEndpoint

- (void)resume:(OSWebQueryHandler)handler {
    super.interface.basePath = @"api/current/";
    [super resume:^(id result, NSError *error) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* data = (NSDictionary*)result;
            Song* song = [[Song alloc] initWithDictionary:data];
            song.cover = [CEWebInterface imageURLForCover:song.cover];
            APPDATA.current = song;
        } else {
            NSLog(@"ERROR: api/current/ doesn't return a JSON dictionary");
        }
        handler(result,error);
    }];
}


@end
