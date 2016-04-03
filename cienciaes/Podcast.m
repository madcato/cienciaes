//
//  Podcast.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Podcast.h"

@implementation Podcast

- (BOOL)isEqual:(Podcast*)object {
    if (self == object) {
        return YES;
    }
    
    if (![self.website isEqualToString:object.website]) {
        return NO;
    }
    
    if (![self.twitter isEqualToString:object.twitter]) {
        return NO;
    }
    
    if (![self.name isEqualToString:object.name]) {
        return NO;
    }

    if (![self.podcastDescription isEqualToString:object.podcastDescription]) {
        return NO;
    }
    
    return YES;
}

@end
