//
//  CEWebObjectFactory.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CEWebObjectFactory.h"
#import "CEWebInterface.h"

@implementation CEWebObjectFactory

- (CECurrentSongEndpoint*)createCurrentEndpointObject {
    CEWebInterface* interface = [[CEWebInterface alloc] init];
    OSJSONDataParser* parser = [[OSJSONDataParser alloc] init];
    CECurrentSongEndpoint* sesion =
    [[CECurrentSongEndpoint alloc] initWithInterface:interface
                                          dataParser:parser];
    return sesion;
}

- (CENextSongEndpoint*)createNextEndpointObject {
    CEWebInterface* interface = [[CEWebInterface alloc] init];
    OSJSONDataParser* parser = [[OSJSONDataParser alloc] init];
    CENextSongEndpoint* sesion =
    [[CENextSongEndpoint alloc] initWithInterface:interface
                                       dataParser:parser];
    return sesion;
}

- (CEStatusEndpoint*)createStatusEndpointObject {
    CEWebInterface* interface = [[CEWebInterface alloc] init];
    OSJSONDataParser* parser = [[OSJSONDataParser alloc] init];
    CEStatusEndpoint* sesion =
    [[CEStatusEndpoint alloc] initWithInterface:interface
                                     dataParser:parser];
    return sesion;
}

- (CELiveEndpoint*)createLiveEndpointObject {
    CEWebInterface* interface = [[CEWebInterface alloc] init];
    OSJSONDataParser* parser = [[OSJSONDataParser alloc] init];
    CELiveEndpoint* sesion =
    [[CELiveEndpoint alloc] initWithInterface:interface
                                   dataParser:parser];
    return sesion;
}

@end
