//
//  LCCollectionViewCell.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCCollectionViewCell.h"

@implementation LCCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_ibImageView];
}



@end
