//
//  Status+JSON.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Status+JSON.h"
#import "NSDictionary+NULLAdditions.h"

@implementation Status (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data {
    data = [data dictionaryByReplacingNullsWithStrings];
    self = [Status new];
    if (self) {
        self.totalTime = [data[@"total_time"] unsignedIntegerValue];
        self.currentTime = [data[@"current_time"] unsignedIntegerValue];
        self.live = [data[@"live"] boolValue];
        self.state = data[@"state"];
        self.song = data[@"song"];
    }
    return self;
}

@end
