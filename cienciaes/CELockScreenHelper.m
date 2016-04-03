//
//  CELockScreenHelper.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CELockScreenHelper.h"

@implementation CELockScreenHelper

+ (void)setLockScreenInfo:(NSString*)albumTitle
                    title:(NSString*)title
                   artist:(NSString*)artist {
    MPNowPlayingInfoCenter* center = [MPNowPlayingInfoCenter defaultCenter];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithDictionary:center.nowPlayingInfo];
    dictionary[MPMediaItemPropertyAlbumTitle] = albumTitle;
    dictionary[MPMediaItemPropertyArtist] = artist;
    dictionary[MPMediaItemPropertyTitle] = title;
    center.nowPlayingInfo = dictionary;
}

+ (void)setLockScreenProgressInfo:(NSNumber*)duration
                         playback:(NSNumber*)playback {
    MPNowPlayingInfoCenter* center = [MPNowPlayingInfoCenter defaultCenter];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithDictionary:center.nowPlayingInfo];
    dictionary[MPNowPlayingInfoPropertyElapsedPlaybackTime] = playback;
    dictionary[MPMediaItemPropertyPlaybackDuration] = duration;
    dictionary[MPNowPlayingInfoPropertyPlaybackRate] = [NSNumber numberWithInt:1];
    center.nowPlayingInfo = dictionary;
}

+ (void)setLockScreenArtwork:(UIImage*)artwork {
    MPNowPlayingInfoCenter* center = [MPNowPlayingInfoCenter defaultCenter];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithDictionary:center.nowPlayingInfo];
    dictionary[MPMediaItemPropertyArtwork] = [[MPMediaItemArtwork alloc] initWithImage:artwork];
    center.nowPlayingInfo = dictionary;
}

@end
