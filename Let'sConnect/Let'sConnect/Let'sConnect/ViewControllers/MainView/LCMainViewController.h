//
//  LCMainViewController.h
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCMainViewController : LCBaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) IBOutlet UICollectionView *ibCollecationView;
@end
