//
//  Status+JSON.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Status+JSON.h"

@implementation Status (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data {
    self = [Status new];
    if (self) {
        self.totalTime = data[@"total_time"];
        self.currentTime = data[@"current_time"];
        self.live = data[@"live"];
        self.state = data[@"state"];
        self.song = data[@"song"];
    }
    return self;
}

@end
