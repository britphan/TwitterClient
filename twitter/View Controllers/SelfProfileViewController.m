//
//  SelfProfileViewController.m
//  twitter
//
//  Created by Britney Phan on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "SelfProfileViewController.h"

@interface SelfProfileViewController ()

@end

@implementation SelfProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[APIManager shared] getUserCredentials:^(User *user, NSError *error) {
        if (user) {
            self.user = user;
            [self.profPicView setImageWithURL:self.user.profPicURL];
            [self.bannerView setImageWithURL:self.user.bannerURL];
            self.profPicView.layer.cornerRadius = self.profPicView.frame.size.height /2;
            self.profPicView.layer.masksToBounds = YES;
            self.profPicView.layer.borderWidth = 0;
            self.nameLabel.text = self.user.name;
            self.usernameLabel.text = self.user.screenName;
            self.descriptionLabel.text = self.user.userDescription;
            self.tweetCountLabel.text = self.user.tweetCount;
            self.followersCountLabel.text = self.user.followersCount;
            self.followingCountLabel.text = self.user.followingCount;
        } else {
            NSLog(@"Error getting user credentials");
        }
    }];
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
