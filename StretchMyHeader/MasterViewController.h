//
//  MasterViewController.h
//  StretchMyHeader
//
//  Created by Samia Al Rahmani on 4/14/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIView *headerUIView;


@end

