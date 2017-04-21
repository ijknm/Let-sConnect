//
//  LCGooglePlaceViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCGooglePlaceViewController.h"
@import GoogleMaps;
@import SceneKit;

@interface LCGooglePlaceViewController ()<GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) GMSMapView *mapView;
@property (strong, nonatomic) SCNView *sceneView;
@end

@implementation LCGooglePlaceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sceneView = [[SCNView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _sceneView.scene = [SCNScene sceneNamed:@"Body Basemesh1.dae"];
    _sceneView.allowsCameraControl = YES;
    _sceneView.autoenablesDefaultLighting = YES;
    _sceneView.backgroundColor = [UIColor clearColor];
    
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:51.5
                                                                longitude:-0.127
                                                                     zoom:11];
    
        _mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        _mapView.delegate = self;
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(51.5, -0.127);
        self.view = _mapView;
    
    [_ibMapView sendSubviewToBack:self.view];
    //Marker1
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [image setImage:[UIImage imageNamed:@"Cat_Oops.png"]];
        marker.iconView =image ;
        marker.map = _mapView;
    
    //Marker2
        GMSMarker *marker2 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(51.414, -0.127)];
        UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [image2 setImage:[UIImage imageNamed:@"Cat_Oops.png"]];
        marker2.iconView =image2 ;
        marker2.map = _mapView;
    
    //Marker3
        GMSMarker *marker3 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(51.453, -0.127)];
        UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [image3 setImage:[UIImage imageNamed:@"Cat_Undecided.png"]];
        marker3.iconView =image3 ;
        marker3.map = _mapView;
}
- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    _mapView.selectedMarker = marker;
    return YES;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    DemoMessagesViewController *vc = [DemoMessagesViewController messagesViewController];
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.text = @"51.5, -0.127";
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    return view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pickPlace:(UIButton *)sender {
    
  }

@end
