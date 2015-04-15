//
//  MasterViewController.m
//  StretchMyHeader
//
//  Created by Samia Al Rahmani on 4/14/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "NewsItem.h"

@interface MasterViewController ()

@property (nonatomic) NSMutableArray *newsItems;
@property (nonatomic, assign) CGFloat kTableHeaderHeight;
@property (nonatomic) UIScrollView *myScrollView;

@end

@implementation MasterViewController

CGFloat const kTableHeaderHeight = 300.0;


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myScrollView.delegate = self;
    
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.headerUIView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -kTableHeaderHeight);
    
    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"d MMMM yyyy"];
    NSString *formattedDate = [formatter stringFromDate: today];
    self.dateLabel.text = formattedDate;
    
    NewsItem *item1 = [[NewsItem alloc] initWithCategory:World andHeadline:@"Climate change protests, divestments meet fossil fuels realities"];
    NewsItem *item2 = [[NewsItem alloc]initWithCategory:Europe andHeadline:@"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"];
    NewsItem *item3 = [[NewsItem alloc] initWithCategory:MiddleEast andHeadline:@"Airstrikes boost Islamic State, FBI director warns more hostages possible"];
    NewsItem *item4 = [[NewsItem alloc] initWithCategory:Africa andHeadline:@"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"];
    NewsItem *item5 = [[NewsItem alloc] initWithCategory:AsiaPacific andHeadline:@"Despite UN ruling, Japan seeks backing for whale hunting"];
    NewsItem *item6 = [[NewsItem alloc] initWithCategory:Americas andHeadline:@"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"];
    NewsItem *item7 = [[NewsItem alloc] initWithCategory:World andHeadline:@"South Africa in $40 billion deal for Russian nuclear reactors"];
    NewsItem *item8 = [[NewsItem alloc]initWithCategory:Europe andHeadline:@"'One million babies' created by EU student exchanges"];

    self.newsItems = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, nil];
    
    [self.navigationController setNavigationBarHidden: YES animated:YES];
    [self updateHeaderView];
}

- (NSString *)newsItemCategoryToString:(NewsItemCategory)newsItemCategory{
    NSString *result = nil;
    switch(newsItemCategory) {
        case World:
            result = @"World";
            break;
        case Americas:
            result = @"Americas";
            break;
        case Europe:
            result = @"Europe";
            break;
        case MiddleEast:
            result = @"MiddleEast";
            break;
        case Africa:
            result = @"Africa";
            break;
        case AsiaPacific:
            result = @"AsiaPacific";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    return result;
}

- (UIColor *)newsItemCategoryToColor:(NewsItemCategory)newsItemCategory{
    UIColor *result = nil;
    switch(newsItemCategory) {
        case World:
            result = [UIColor redColor];
            break;
        case Americas:
            result = [UIColor blueColor];
            break;
        case Europe:
            result = [UIColor purpleColor];
            break;
        case MiddleEast:
            result = [UIColor greenColor];
            break;
        case Africa:
            result = [UIColor grayColor];
            break;
        case AsiaPacific:
            result = [UIColor orangeColor];
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    return result;
}

- (void)updateHeaderView{
    CGRect tableHeader = CGRectMake(0, -kTableHeaderHeight, self.tableView.frame.size.width, kTableHeaderHeight);
    
    if (self.tableView.contentOffset.y < -kTableHeaderHeight){
        tableHeader.origin.y = self.tableView.contentOffset.y;
        tableHeader.size.height = -self.tableView.contentOffset.y;
    }
    self.headerUIView.frame = tableHeader;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self updateHeaderView];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NewsItem *object = self.newsItems[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NewsItem *object = self.newsItems[indexPath.row];
    
    cell.headlineLabel.text = [object headline];
    cell.categoryLabel.text = [self newsItemCategoryToString:object.category];
    cell.categoryLabel.textColor = [self newsItemCategoryToColor:object.category];
    return cell;
}



@end
