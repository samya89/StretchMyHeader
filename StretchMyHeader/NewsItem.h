//
//  NewsItem.h
//  StretchMyHeader
//
//  Created by Samia Al Rahmani on 4/14/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NewsItemCategory) {
    World,
    Americas,
    Europe,
    MiddleEast,
    Africa,
    AsiaPacific,
};

@interface NewsItem : NSObject

@property (nonatomic, assign) NewsItemCategory category;
@property (nonatomic, strong) NSString *headline;

- (instancetype)initWithCategory:(NewsItemCategory)category andHeadline:(NSString *)headline;

@end
