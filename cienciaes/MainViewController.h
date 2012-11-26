//
//  MainViewController.h
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
