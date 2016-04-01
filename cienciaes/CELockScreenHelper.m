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
                   artist:(NSString*)artist
                  artwork:(UIImage*)artwork
                 duration:(NSNumber*)duration
                 playback:(NSNumber*)playback {
    MPNowPlayingInfoCenter* center = [MPNowPlayingInfoCenter defaultCenter];
    center.nowPlayingInfo = @{
      MPMediaItemPropertyAlbumTitle: albumTitle,
      MPMediaItemPropertyArtist: artist,
      MPMediaItemPropertyArtwork: [[MPMediaItemArtwork alloc] initWithImage:artwork],
      MPMediaItemPropertyPlaybackDuration: duration,
      MPMediaItemPropertyTitle: title,
      MPNowPlayingInfoPropertyElapsedPlaybackTime: playback
      };
}

@end
