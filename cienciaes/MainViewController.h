//
//  MainViewController.h
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "FlipsideViewController.h"
#import <CoreData/CoreData.h>


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    AVPlayer* audioPlayer;

}

-(void)checkState;
-(void)appBecomeActive;

@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)playPressed:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *volumeParentView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
