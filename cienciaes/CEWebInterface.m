//
//  CEWebInterface.m
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CEWebInterface.h"

#define SERVER @"ns331078.ip-176-31-120.eu"

@implementation CEWebInterface

- (instancetype)init {
    self = [super initWithProtocol:@"http" server:SERVER basePath:@"api"];
    
    return self;
}

+ (NSString*)imageURLForCover:(NSString*)cover {
    NSString* path = [NSString stringWithFormat:@"http://%@/static/images/covers/%@",SERVER,cover];
    return path;
}

+ (NSString*)imageURLForLiveCover:(NSString*)cover {
    NSString* path = [NSString stringWithFormat:@"http://%@/static/images/live_covers/%@",SERVER,cover];
    return path;
}

@end
