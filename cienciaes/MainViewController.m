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
	
    NSError* error = nil;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://38.96.148.104:8432/;stream.nsv&#038;type=mp3&#038;volume=50&#038;autostart=false&#038;frontcolor=0xeeeeee&#038;backcolor=0x000000&#038;lightcolor=0xffffff"] error:&error];
    
    if(error) NSLog(@"URL Error: %@",[error description]);
    [audioPlayer prepareToPlay];
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
    [super viewDidUnload];
}
- (IBAction)playPressed:(id)sender {
    [audioPlayer play];
}
@end
