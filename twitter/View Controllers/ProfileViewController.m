//
//  ProfileViewController.m
//  twitter
//
//  Created by Britney Phan on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "APIManager.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.profPicView setImageWithURL:self.user.profPicURL];
    [self.bannerView setImageWithURL:self.user.bannerURL];
    self.nameLabel.text = self.user.name;
    self.usernameLabel.text = self.user.screenName;
    self.descriptionLabel.text = self.user.userDescription;
    self.tweetCountLabel.text = self.user.tweetCount;
    self.followersCountLabel.text = self.user.followersCount;
    self.followingCountLabel.text = self.user.followingCount;
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
