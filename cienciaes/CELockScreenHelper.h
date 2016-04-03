//
//  CELockScreenHelper.h
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CELockScreenHelper : NSObject

+ (void)setLockScreenInfo:(NSString*)albumTitle
                    title:(NSString*)title
                   artist:(NSString*)artist;
+ (void)setLockScreenProgressInfo:(NSNumber*)duration
                         playback:(NSNumber*)playback;
+ (void)setLockScreenArtwork:(UIImage*)artwork;

@end
