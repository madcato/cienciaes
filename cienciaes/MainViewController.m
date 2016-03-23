//
//  MainViewController.m
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPlayButtonImage];
    
    MPVolumeView *myVolumeView =
    [[MPVolumeView alloc] initWithFrame: _volumeParentView.bounds];
    [_volumeParentView addSubview: myVolumeView];
    
    [[UISlider appearance] setMinimumTrackTintColor:[UIColor blackColor]];
    [[UISlider appearance] setMaximumTrackTintColor:[UIColor darkGrayColor]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self checkState];
}

-(void)resetAudioPlayer
{
    if(audioPlayer) {
        [audioPlayer removeObserver:self forKeyPath:@"status"];
    }
    audioPlayer = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://ns331078.ip-176-31-120.eu:8000/mpd"]];
    [audioPlayer addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];

    [self checkState];
}

-(void)checkState
{
    switch ([audioPlayer status]) {
        case AVPlayerStatusUnknown:
            [_activityIndicator startAnimating];
            [_playButton setHidden:YES];
            break;
        case AVPlayerStatusReadyToPlay:
            [_activityIndicator stopAnimating];
            [_playButton setHidden:NO];
            [self setPlayButtonImage];
            break;
        case AVPlayerStatusFailed:{
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[[audioPlayer error] localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            [alertView show];
        }
        default:
            break;
    };
}

-(void)appBecomeActive
{
    if([audioPlayer rate] > 0) {
        [self setPauseButtonImage];
    } else {
        [self resetAudioPlayer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)viewDidUnload {
    [self setPlayButton:nil];
    [self setVolumeParentView:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
}

- (IBAction)playPressed:(id)sender
{
    if([audioPlayer rate] > 0) {
        // Pause
        [audioPlayer pause];
        [self setPlayButtonImage];
    } else {
        // Start
        [audioPlayer play];
        [self setPauseButtonImage];

    }
}

-(void)setPlayButtonImage
{
    [_playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [_playButton setImage:[UIImage imageNamed:@"play_high"] forState:UIControlStateHighlighted];
}

-(void)setPauseButtonImage
{
    [_playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    [_playButton setImage:[UIImage imageNamed:@"pause_high"] forState:UIControlStateHighlighted];
}

@end
