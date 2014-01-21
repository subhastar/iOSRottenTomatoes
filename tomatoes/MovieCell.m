//
//  MovieCell.m
//  tomatoes
//
//  Created by subha on 1/20/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "MovieCell.h"
#import "Movie.h"

@interface MovieCell ()

@property (nonatomic, weak) IBOutlet UILabel* movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel* synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;

@end

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setMovie:(Movie *)movie
{
    self.movieTitleLabel.text = movie.title;
    self.synopsisLabel.text = movie.synopsis;
    self.castLabel.text = movie.cast;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
