//
//  FlipsideViewController.h
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (assign, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

- (IBAction)joseMailPressed:(id)sender;
- (IBAction)daniMailPressed:(id)sender;
- (IBAction)infoMailPressed:(id)sender;
- (IBAction)urlPressed:(id)sender;
- (IBAction)radioPressed:(id)sender;
- (IBAction)cianciaesPRessed:(id)sender;
- (IBAction)josePressed:(id)sender;
- (IBAction)madcatoPressed:(id)sender;

@end
