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

@implementation CENextSongEndpoint

- (void)resume:(OSWebQueryHandler)handler {
    super.interface.basePath = @"api/next/";
    [super resume:^(id result, NSError *error) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* data = (NSDictionary*)result;
            Song* song = [[Song alloc] initWithDictionary:data];
            APPDATA.next = song;
            handler(result,error);
        } else {
            NSLog(@"ERROR: api/current/ doesn't return a JSON dictionary");
        }

    }];
}

@end
