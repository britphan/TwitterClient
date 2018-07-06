//
//  User.m
//  twitter
//
//  Created by Britney Phan on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profPicURL = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
        self.bannerURL = [NSURL URLWithString:dictionary[@"profile_banner_url"]];
        self.tweetCount = [NSString stringWithFormat:@"%@", dictionary[@"statuses_count"]];
        self.followersCount = [NSString stringWithFormat:@"%@", dictionary[@"followers_count"]];
        self.followingCount = [NSString stringWithFormat:@"%@", dictionary[@"friends_count"]];
        self.userDescription = dictionary[@"description"];
        // Initialize any other properties
    }
    return self;
}

@end
