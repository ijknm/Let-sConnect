//
//  LCFontCosViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCFontCosViewController.h"
#import "LCGooglePlaceViewController.h"
#import "LCCollectionViewCell.h"
@import GooglePlacePicker;
@import GooglePlaces;


@interface LCFontCosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation LCFontCosViewController{
    GMSPlacePicker *_placePicker;
    GMSPlacesClient *_placesClient;
    NSMutableArray *fontArray;
    BOOL isSlecated;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.image = [UIImage imageNamed:_imageNameString];
    // Do any additional setup after loading the view from its nib.
    [self setUpCollecationView];
    
        _sceneView.scene = [SCNScene sceneNamed:@"Spaceship.dae"];
        _sceneView.allowsCameraControl = YES;
        _sceneView.autoenablesDefaultLighting = YES;
    
        [self changeColor:[UIColor purpleColor]];
  
    
    _redBUtton.backgroundColor = [UIColor redColor];
    _blueColor.backgroundColor = [UIColor blueColor];
    _blackColor.backgroundColor = [UIColor blackColor];
    _greenColor.backgroundColor = [UIColor greenColor];
    _lightGrayColor.backgroundColor = [UIColor lightGrayColor];
}

-(IBAction)didTapRedColor:(id)sender{
     [self changeColor:[UIColor redColor]];
}
-(IBAction)didTapOnBlackColor:(id)sender{
      [self changeColor:[UIColor blackColor]];
}
-(IBAction)didTapgreenColor:(id)sender{
    [self changeColor:[UIColor greenColor]];
}
-(IBAction)didTapOnlightGrayColor:(id)sender{
      [self changeColor:[UIColor lightGrayColor]];
}
-(IBAction)didTapblueColor:(id)sender{
    [self changeColor:[UIColor blueColor]];
}


-(void)changeColor:(UIColor *)color{
    if (isSlecated) {
        SCNNode *node = self.sceneView.scene.rootNode;
        NSArray *nodes = [node childNodes];
        
        SCNNode *colornode = [nodes objectAtIndex:0];
        SCNMaterial *matical = [colornode.geometry.materials objectAtIndex:1];
        matical.diffuse.contents = color;
        
        SCNNode *colornode2 = [nodes objectAtIndex:1];
        SCNMaterial *matical2 = [colornode2.geometry.materials objectAtIndex:1];
        matical2.diffuse.contents = [UIColor greenColor];
    }
   
    
//    for (SCNNode *node in nodes){
//        SCNMaterial *matical = [node.geometry.materials objectAtIndex:1];
//        matical.diffuse.contents = color;
//    }
}

-(IBAction)diSelect3DImageChane:(id)sender{
    isSlecated = NO;
    _sceneView.scene = [SCNScene sceneNamed:@"Body Basemesh1.dae"];
    _sceneView.allowsCameraControl = YES;
    _sceneView.autoenablesDefaultLighting = YES;

}







-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [fontArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCCollectionViewCell *cell = (LCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 6;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.ibImageView.image =[UIImage imageNamed:[fontArray objectAtIndex:indexPath.row]];
    
    //    cell.ibImageView.backgroundColor = [UIColor clearColor];
//    UILabel *label = [[UILabel alloc]initWithFrame:cell.frame];
//    label.text = @"Content";
//    label.font = [UIFont fontWithName:[fontArray objectAtIndex:indexPath.row] size:20];
//    [cell.ibImageView addSubview:label];
    
    return cell;

}

-(IBAction)didTapGooleMapPlace:(id)sender{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.788204, -122.411937);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001,
                                                                  center.longitude + 0.001);
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001,
                                                                  center.longitude - 0.001);
    GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                         coordinate:southWest];
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:viewport];
    _placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
    
    [_placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
        if (error != nil) {
            NSLog(@"Pick Place error %@", [error localizedDescription]);
            return;
        }
        if (place != nil) {
                LCGooglePlaceViewController *googlePlace = [[LCGooglePlaceViewController alloc]init];
                [self.navigationController pushViewController:googlePlace animated:YES];
        } else {
            
        }
    }];
}
-(void)setUpCollecationView{
    self.ibCollecationView.delegate = self;
    self.ibCollecationView.dataSource = self;
    [self.ibCollecationView registerNib:[UINib nibWithNibName:@"LCCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    self.ibCollecationView.backgroundColor = [UIColor clearColor];
    fontArray = [[NSMutableArray alloc]init];
    NSString *bundleRootPath = [[NSBundle mainBundle] bundlePath];
    NSArray *bundleRootContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundleRootPath error:nil];
    NSArray *files = [bundleRootContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self beginswith 'Koala' OR self beginswith 'Cat' OR self beginswith 'Bunny'"]];
    fontArray = [files mutableCopy];
    
    [_ibCollecationView reloadData];
    isSlecated = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

@end
