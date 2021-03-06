//
//  ComposeViewController.h
//  twitter
//
//  Created by Britney Phan on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "APIManager.h"

@protocol ComposeViewControllerDelegate;


@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

@end



@protocol ComposeViewControllerDelegate 
- (void)didTweet:(Tweet *)tweet;

@end
