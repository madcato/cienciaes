//
//  CEWebInterface.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CEWebInterface.h"

@implementation CEWebInterface

- (instancetype)init {
    self = [super initWithProtocol:@"http" server:@"ns331078.ip-176-31-120.eu" basePath:@"api"];
    
    return self;
}
@end
