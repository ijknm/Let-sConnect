//
//  LCCollectionViewCell.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCCollectionViewCell.h"
@import SceneKit;

@implementation LCCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_ibImageView];
    // Initialization code

//    myView.backgroundColor = [UIColor lightGrayColor];

}



@end
