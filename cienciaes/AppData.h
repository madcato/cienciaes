//
//  AppData.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Entity.h"
#import "Song.h"
#import "Status.h"

@interface AppData : Entity

@property (nonatomic, strong) Song* next;
@property (nonatomic, strong) Song* current;

@property (nonatomic, strong) Status* status;
@property (nonatomic, strong) Status* live;

@property (nonatomic, strong) UIImage* artwork;

@end
