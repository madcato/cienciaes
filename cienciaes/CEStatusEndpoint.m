//
//  CEStatusEndpoint.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CEStatusEndpoint.h"
#import "Status+JSON.h"
#import "AppDelegate.h"

@implementation CEStatusEndpoint

- (void)resume:(OSWebQueryHandler)handler {
    super.interface.basePath = @"api/status/";
    [super resume:^(id result, NSError *error) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary* data = (NSDictionary*)result;
            Status* status = [[Status alloc] initWithDictionary:data];
            APPDATA.status = status;
        } else {
            NSLog(@"ERROR: api/status/ doesn't return a JSON dictionary");
        }
        handler(result,error);
    }];

}

@end
