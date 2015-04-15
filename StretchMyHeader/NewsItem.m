//
//  NewsItem.m
//  StretchMyHeader
//
//  Created by Samia Al Rahmani on 4/14/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem


- (instancetype)initWithCategory:(NewsItemCategory)category andHeadline:(NSString *)headline{
    self = [super init];
    if (self) {
        _category = category;
        _headline = headline;
    }
    return self;
}







@end
