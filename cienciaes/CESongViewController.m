//
//  CESongViewController.m
//  cienciaes
//
//  Created by Daniel Vela on 01/04/16.
//  Copyright © 2016 veladan. All rights reserved.
//

#import "CESongViewController.h"
#import "AppData.h"
#import "CEWebInterface.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface CESongViewController ()

@property (nonatomic, strong) Song* previousSong;
@end

@implementation CESongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = @"";
    self.subtitleLabel.text = @"";
    self.artwork.image = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    
dispatch_async(dispatch_get_main_queue() , ^{
    

    AppData* data = (AppData*)object;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    Song* song = (Song*)[data performSelector:NSSelectorFromString(keyPath)];
#pragma clang diagnostic pop
    
    if ([song isEqual:_previousSong]) {
        // If data is the same, not make any change or animation
        return;
    }
    _previousSong = song;
    if (song != nil) {
        self.titleLabel.text = song.title;
        self.titleLabel.alpha = 0.0;
        self.subtitleLabel.text = song.podcast.name;
        self.subtitleLabel.alpha = 0.0;
        [UIView animateWithDuration:0.8 animations:^{
            self.titleLabel.alpha = 1.0;
            self.subtitleLabel.alpha = 1.0;
        }];
        // Downnload and show image cover
        self.artwork.image = nil;
        [self.artwork sd_setImageWithURL:[NSURL URLWithString:song.cover]
                               completed:
         ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
             self.artwork.image = image;
             self.artwork.alpha = 0.0;
             [UIView animateWithDuration:0.8 animations:^{
                 self.artwork.alpha = 1.0;
             }];
        }];
    } else {
        [UIView animateWithDuration:0.8 animations:^{
            self.titleLabel.alpha = 0.0;
            self.subtitleLabel.alpha = 0.0;
            self.artwork.alpha = 0.0;
        }];
    }
});
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
