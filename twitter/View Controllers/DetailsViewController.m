//
//  DetailsViewController.m
//  twitter
//
//  Created by Britney Phan on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweet = self.cell.tweet;
    if (self.tweet) {
        
        if(self.tweet.retweeted) {
            self.retweetButton.selected = YES;
        }
        if(self.tweet.favorited) {
            self.favoriteButton.selected = YES;
        }
        self.dateLabel.text = self.tweet.createdAtString;
        [self.profPicView setImageWithURL:self.tweet.user.profPicURL];
        self.nameLabel.text = self.tweet.user.name;
        self.usernameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
        self.tweetLabel.text = self.tweet.text;
        self.retweetCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
        self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
        
    }
}
- (IBAction)didTapRetweet:(id)sender {
    if (!self.tweet.retweeted){
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.selected = YES;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    } else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetButton.selected = NO;
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
}
- (IBAction)didTapFavorite:(id)sender {
    
    if (!self.tweet.favorited){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteButton.selected = YES;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    } else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        self.favoriteButton.selected = NO;
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
