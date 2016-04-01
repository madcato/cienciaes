//
//  Song.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Entity.h"
#import "Podcast.h"

@interface Song : Entity

@property (nonatomic, assign) NSUInteger duration;
@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) Podcast* podcast;
@property (nonatomic, strong) NSString* cover;
@property (nonatomic, strong) NSString* title;

@end
