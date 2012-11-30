//
//  FlipsideViewController.m
//  cienciaes
//
//  Created by Daniel Vela on 26/11/12.
//  Copyright (c) 2012 inycom. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)joseMailPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:radio@cienciaes.com"]];
}

- (IBAction)daniMailPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:daniel@veladan.com"]];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
- (IBAction)infoMailPressed:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:oyentes@cienciaes.com"]];
}

- (IBAction)urlPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cienciaes.com"]];
}
@end
