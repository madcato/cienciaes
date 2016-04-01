//
//  Status+JSON.h
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "Status.h"

@interface Status (JSON)

- (instancetype)initWithDictionary:(NSDictionary*)data;

@end
