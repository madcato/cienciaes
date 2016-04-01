//
//  Status.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Entity.h"

@interface Status : Entity

@property (nonatomic, assign) NSUInteger totalTime;
@property (nonatomic, assign) NSUInteger currentTime;
@property (nonatomic, assign) BOOL live;
@property (nonatomic, assign) NSString* state;
@property (nonatomic, assign) NSUInteger song;

@end
