//
//  MovieCell.h
//  tomatoes
//
//  Created by subha on 1/20/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel* synopsisLabel;

@end
