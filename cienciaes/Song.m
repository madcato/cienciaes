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

@end
