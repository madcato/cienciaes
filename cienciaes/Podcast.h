//
//  Podcast.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Entity.h"

@interface Podcast : Entity


@property (nonatomic, strong) NSString* website;
@property (nonatomic, strong) NSString* twitter;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* podcastDescription;

@end
