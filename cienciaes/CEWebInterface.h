//
//  CEWebInterface.h
//  cienciaes
//
//  Created by Daniel Vela on 29/03/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "OSLibrary/OSWebInterface.h"

@interface CEWebInterface : OSWebInterface

+ (NSString*)imageURLForCover:(NSString*)cover;
+ (NSString*)imageURLForLiveCover:(NSString*)cover;

@end
