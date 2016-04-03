//
//  Song+JSON.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Song+JSON.h"
#import "NSDictionary+NULLAdditions.h"

@implementation Song (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data {
    data = [data dictionaryByReplacingNullsWithStrings];
    self = [Song new];
    if (self) {
        self.duration = [data[@"duration"] unsignedIntegerValue];
        self.type = data[@"type"];
        NSDictionary* podcast = [data[@"podcast"] dictionaryByReplacingNullsWithStrings];
        self.podcast.website = podcast[@"website"];
        self.podcast.twitter = podcast[@"twitter"];
        self.podcast.name = podcast[@"name"];
        self.podcast.podcastDescription = podcast[@"description"];
        self.cover = data[@"cover"];
        self.title = data[@"title"];
    }
    return self;
}

@end
