//
//  ErrorView.m
//  tomatoes
//
//  Created by subha on 1/21/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "ErrorView.h"

@implementation ErrorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"inside error view.");
        [[NSBundle mainBundle] loadNibNamed:@"ErrorView" owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
