//
//  LCFontCosViewController.h
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCBaseViewController.h"
@import SceneKit;


@interface LCFontCosViewController : LCBaseViewController
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSString *imageNameString;
@property (nonatomic, strong) IBOutlet UICollectionView *ibCollecationView;
@property (weak) IBOutlet SCNView *sceneView;


@property (nonatomic, strong) IBOutlet UIButton *redBUtton;
@property (nonatomic, strong) IBOutlet UIButton *blueColor;
@property (nonatomic, strong) IBOutlet UIButton *blackColor;
@property (nonatomic, strong) IBOutlet UIButton *greenColor;
@property (nonatomic, strong) IBOutlet UIButton *lightGrayColor;

@end
