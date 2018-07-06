//
//  TweetCell.m
//  twitter
//
//  Created by Britney Phan on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.profilePicView addGestureRecognizer:profileTapGestureRecognizer];
    [self.profilePicView setUserInteractionEnabled:YES];

}

- (void) didTapUserProfile:(UITapGestureRecognizer *)sender{
    [self.delegate tweetCell:self didTap:self.tweet.user];
}

-(void)configureCell {
    if (self.tweet) {
        NSLog(@"%@",self.tweet.user.profPicURL.absoluteString);
        self.dateLabel.text = self.tweet.createdAtString;
        [self.profilePicView setImageWithURL:self.tweet.user.profPicURL];
        self.nameLabel.text = self.tweet.user.name;
        self.usernameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
        self.tweetLabel.text = self.tweet.text;
        self.rtCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
        self.favCountLabel.text = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
        if(self.tweet.retweeted) {
            self.retweetButton.selected = YES;
        }
        if(self.tweet.favorited) {
            self.favoriteButton.selected = YES;
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    [self refreshData];
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
    [self refreshData];
}
- (void)refreshData{
    self.favCountLabel.text = [NSString stringWithFormat: @"%d", self.tweet.favoriteCount];
    
    self.rtCountLabel.text = [NSString stringWithFormat: @"%d", self.tweet.retweetCount];
}

@end
