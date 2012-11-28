//
//  MainViewController.h
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "FlipsideViewController.h"
#import <CoreData/CoreData.h>

@class AudioStreamer;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    AVAudioPlayer* audioPlayer;
    
    AudioStreamer *streamer;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)playPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *volumeParentView;
@end
