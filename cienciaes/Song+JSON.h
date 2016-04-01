//
//  Song+JSON.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#include "Song.h"

@interface Song (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data;

@end
