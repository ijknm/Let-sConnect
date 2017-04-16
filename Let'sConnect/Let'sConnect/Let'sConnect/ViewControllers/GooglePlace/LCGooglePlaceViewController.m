//
//  LCGooglePlaceViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCGooglePlaceViewController.h"
@import GoogleMaps;

@interface LCGooglePlaceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@end

@implementation LCGooglePlaceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pickPlace:(UIButton *)sender {
    
  }

@end
