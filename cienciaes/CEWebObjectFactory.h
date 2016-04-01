//
//  CEWebObjectFactory.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CECurrentSongEndpoint.h"
#import "CENextSongEndpoint.h"
#import "CEStatusEndpoint.h"
#import "CELiveEndpoint.h"

@interface CEWebObjectFactory : NSObject

- (CECurrentSongEndpoint*)createCurrentEndpointObject;
- (CENextSongEndpoint*)createNextEndpointObject;
- (CEStatusEndpoint*)createStatusEndpointObject;
- (CELiveEndpoint*)createLiveEndpointObject;

@end
