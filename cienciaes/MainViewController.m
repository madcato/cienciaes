//
//  MainViewController.m
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "MainViewController.h"
#import "AudioStreamer.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSError* error = nil;
/*    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://38.96.148.104:8432/;stream.nsv&#038;type=mp3&#038;volume=50&#038;autostart=false&#038;frontcolor=0xeeeeee&#038;backcolor=0x000000&#038;lightcolor=0xffffff"] error:&error];
    
    if(error) NSLog(@"URL Error: %@",[error description]);
    [audioPlayer prepareToPlay];*/
    
    
    MPVolumeView *myVolumeView =
    [[MPVolumeView alloc] initWithFrame: _volumeParentView.bounds];
    [_volumeParentView addSubview: myVolumeView];
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
    [super viewDidUnload];
}

- (IBAction)playPressed:(id)sender {
    [self createStreamer];

    [streamer start];
}

#pragma mark - streamer

    //
    // destroyStreamer
    //
    // Removes the streamer, the UI update timer and the change notification
    //
- (void)destroyStreamer
{
	if (streamer)
        {
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:streamer];
            //&		[progressUpdateTimer invalidate];
            //	progressUpdateTimer = nil;
		
		[streamer stop];
		streamer = nil;
        }
}

    //
    // createStreamer
    //
    // Creates or recreates the AudioStreamer object.
    //
- (void)createStreamer
{
	if (streamer)
        {
		return;
        }
    
	[self destroyStreamer];
	
    NSString* radiourl = @"http://38.96.148.104:8432/;stream.nsv&#038;type=mp3&#038;volume=50&#038;autostart=false&#038;frontcolor=0xeeeeee&#038;backcolor=0x000000&#038;lightcolor=0xffffff";
	NSString *escapedValue =
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                 nil,
                                                                 (CFStringRef)radiourl,
                                                                 NULL,
                                                                 NULL,
                                                                 kCFStringEncodingUTF8);
    
	NSURL *url = [NSURL URLWithString:escapedValue];
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
/*	progressUpdateTimer =
    [NSTimer
     scheduledTimerWithTimeInterval:0.1
     target:self
     selector:@selector(updateProgress:)
     userInfo:nil
     repeats:YES];*/
    
	[[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(playbackStateChanged:)
     name:ASStatusChangedNotification
     object:streamer];

}

    //
    // playbackStateChanged:
    //
    // Invoked when the AudioStreamer
    // reports that its playback status has changed.
    //
- (void)playbackStateChanged:(NSNotification *)aNotification
{
	if ([streamer isWaiting])
        {
		[self setButtonImageNamed:@"loadingbutton.png"];
        }
	else if ([streamer isPlaying])
        {
		[self setButtonImageNamed:@"stopbutton.png"];
        }
	else if ([streamer isIdle])
        {
		[self destroyStreamer];
		[self setButtonImageNamed:@"playbutton.png"];
        }
}

    //
    // setButtonImageNamed:
    //
    // Used to change the image on the playbutton. This method exists for
    // the purpose of inter-thread invocation because
    // the observeValueForKeyPath:ofObject:change:context: method is invoked
    // from secondary threads and UI updates are only permitted on the main thread.
    //
    // Parameters:
    //    imageNamed - the name of the image to set on the play button.
    //
- (void)setButtonImageNamed:(NSString *)imageName
{
	if (!imageName)
        {
		imageName = @"playButton";
        }
	
	
	UIImage *image = [UIImage imageNamed:imageName];
	
	[_playButton.layer removeAllAnimations];
	[_playButton setImage:image forState:0];
    
	if ([imageName isEqual:@"loadingbutton.png"])
        {
		[self spinButton];
        }
}


    //
    // spinButton
    //
    // Shows the spin button when the audio is loading. This is largely irrelevant
    // now that the audio is loaded from a local file.
    //
- (void)spinButton
{
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	CGRect frame = [_playButton frame];
	_playButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
	_playButton.layer.position = CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height);
	[CATransaction commit];
    
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:2.0] forKey:kCATransactionAnimationDuration];
    
	CABasicAnimation *animation;
	animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	animation.fromValue = [NSNumber numberWithFloat:0.0];
	animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
	animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	[_playButton.layer addAnimation:animation forKey:@"rotationAnimation"];
    
	[CATransaction commit];
}

@end
