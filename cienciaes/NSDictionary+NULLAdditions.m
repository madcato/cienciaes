//
//  NSDictionary+NULLAdditions.m
//  cienciaes
//
//  Created by Daniel Vela on 02/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "NSDictionary+NULLAdditions.h"

@implementation NSDictionary (NULLAdditions)

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const NSString *blank = @"";
    
    for(NSString *key in self) {
        const id object = [self objectForKey:key];
        if([object isKindOfClass:[NSNull class]]) {
            //pointer comparison is way faster than -isKindOfClass:
            //since [NSNull null] is a singleton, they'll all point to the same
            //location in memory.
            [replaced setObject:blank
                         forKey:key];
        }
    }
    
    return [replaced copy];
}

@end