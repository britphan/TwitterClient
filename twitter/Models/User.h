//
//  User.h
//  twitter
//
//  Created by Britney Phan on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

// MARK: Properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSURL *profPicURL;
@property (strong, nonatomic) NSURL *bannerURL;
@property (strong, nonatomic) NSString *tweetCount;
@property (strong, nonatomic) NSString *followingCount;
@property (strong, nonatomic) NSString *followersCount;
@property (strong, nonatomic) NSString *userDescription;

// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
