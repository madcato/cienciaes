//
//  Song+JSON.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Song+JSON.h"

@implementation Song (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data {
    self = [Song new];
    if (self) {
        self.duration = data[@"duration"];
        self.type = data[@"type"];
        self.podcast.website = data[@"podcast"][@"website"];
        self.podcast.twitter = data[@"podcast"][@"twitter"];
        self.podcast.name = data[@"podcast"][@"name"];
        self.podcast.podcastDescription = data[@"podcast"][@"description"];
        self.cover = data[@"cover"];
        self.title = data[@"title"];
    }
    return self;
}

@end
