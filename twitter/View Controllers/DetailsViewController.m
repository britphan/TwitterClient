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
        
        self.dateLabel.text = self.tweet.createdAtString;
        [self.profPicView setImageWithURL:self.tweet.user.profPicURL];
        self.nameLabel.text = self.tweet.user.name;
        self.usernameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
        self.tweetLabel.text = self.tweet.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapBackButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
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
