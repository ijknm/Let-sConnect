//
//  LCGooglePlaceViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCGooglePlaceViewController.h"
@import GoogleMaps;

@interface LCGooglePlaceViewController ()<GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@end

@implementation LCGooglePlaceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:1.285
                                                                longitude:103.848
                                                                     zoom:12];
    
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.delegate = self;
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(51.5, -0.127);
        self.view = mapView;
        GMSMarker *london = [GMSMarker markerWithPosition:position];
        london.title = @"London";
        london.icon = [UIImage imageNamed:@"poker_3.jpg"];
        london.map = mapView;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    // your code
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pickPlace:(UIButton *)sender {
    
  }

@end
