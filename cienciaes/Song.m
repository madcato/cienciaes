//
//  Song.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Song.h"

@implementation Song

- (Podcast*)podcast {
    if (_podcast == nil) {
        _podcast = [Podcast new];
    }
    return _podcast;
}

- (BOOL)isEqual:(Song*)object {
    if (self == object) {
        return YES;
    }
    
    if (self.duration != object.duration) {
        return NO;
    }
    
    if (![self.type isEqualToString:object.type]) {
        return NO;
    }
    
    if (![self.podcast isEqual:object.podcast]) {
        return NO;
    }
    
    if (![self.cover isEqualToString:object.cover]) {
        return NO;
    }
    
    if (![self.type isEqualToString:object.type]) {
        return NO;
    }
    
    return YES;
}


@end
