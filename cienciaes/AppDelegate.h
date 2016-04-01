//
//  AppDelegate.h
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AppData.h"

#define APPDATA ((AppDelegate*)[UIApplication sharedApplication].delegate).appData


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) AppData *appData;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
