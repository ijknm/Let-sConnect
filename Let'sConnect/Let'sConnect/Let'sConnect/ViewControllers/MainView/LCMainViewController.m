//
//  LCMainViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/13/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCMainViewController.h"
#import "LCCollectionViewCell.h"
#import "LCAvatarViewController.h"
#import "LCFontCosViewController.h"

@interface LCMainViewController ()
@end

@implementation LCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadImages];
    self.ibCollecationView.delegate = self;
    self.ibCollecationView.dataSource = self;
    [self.ibCollecationView registerNib:[UINib nibWithNibName:@"LCCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    self.ibCollecationView.backgroundColor = [UIColor clearColor];
}
-(void)loadImages {
    self.images = [[NSMutableArray alloc]init];
    NSString *bundleRootPath = [[NSBundle mainBundle] bundlePath];
    NSArray *bundleRootContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundleRootPath error:nil];
    NSArray *files = [bundleRootContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self beginswith 'Koala' OR self beginswith 'Cat' OR self beginswith 'Bunny'"]];
    self.images = [files mutableCopy];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.ibCollecationView reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.images count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCCollectionViewCell *cell = (LCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 6;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.ibImageView.image =[UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
 
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LCFontCosViewController *fontVC = [[LCFontCosViewController alloc]init];
    fontVC.imageNameString = [self.images objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:fontVC animated:YES];
}
-(IBAction)DidTapFirstTypeImages:(id)sender{
    [self.images removeAllObjects];
    NSString *bundleRootPath = [[NSBundle mainBundle] bundlePath];
    NSArray *bundleRootContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundleRootPath error:nil];
    NSArray *files = [bundleRootContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self beginswith 'Koala' OR self beginswith 'Cat' OR self beginswith 'Bunny'"]];
    self.images = [files mutableCopy];
        [self.ibCollecationView reloadData];

}
-(IBAction)DidTapOnSecondTypeOfImages:(id)sender{
    [self.images removeAllObjects];
    NSString *bundleRootPath = [[NSBundle mainBundle] bundlePath];
    NSArray *bundleRootContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:bundleRootPath error:nil];
    NSArray *files = [bundleRootContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self beginswith 'poker' OR self beginswith 'Poker'"]];
    self.images = [files mutableCopy];
    [self.ibCollecationView reloadData];
}
-(IBAction)didTapOnMaleTapped:(id)sender{
    LCFontCosViewController *fontVC = [[LCFontCosViewController alloc]init];
    fontVC.imageNameString = @"poker_6.jpg";
    [self.navigationController pushViewController:fontVC animated:YES];
}
-(IBAction)didTapOnFemaleTapped:(id)sender{
    LCFontCosViewController *fontVC = [[LCFontCosViewController alloc]init];
    fontVC.imageNameString = @"poker_1548.png";
    [self.navigationController pushViewController:fontVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
