//
//  LCSignInViewController.m
//  Let'sConnect
//
//  Created by praveen on 4/12/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCSignInViewController.h"
#import <DigitsKit/DigitsKit.h>
#import "LCMainViewController.h"

@interface LCSignInViewController ()

@end

@implementation LCSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Digits *digits = [Digits sharedInstance];
    DGTAuthenticationConfiguration *configuration = [[DGTAuthenticationConfiguration alloc] initWithAccountFields:DGTAccountFieldsDefaultOptionMask];
    
    DGTAppearance *digitsAppearance = [[DGTAppearance alloc] init];
    digitsAppearance.accentColor = [UIColor greenColor];
    digitsAppearance.headerFont = [UIFont fontWithName:@"HelveticaNeue" size:18];
    digitsAppearance.labelFont = [UIFont fontWithName:@"HelveticaNeue" size:16];
    digitsAppearance.bodyFont = [UIFont fontWithName:@"HelveticaNeue" size:16];
    [digitsAppearance applyUIAppearanceColors];
    
    configuration.appearance = digitsAppearance;
    
    
    [digits authenticateWithViewController:nil configuration:configuration completion:^(DGTSession *session, NSError *error) {
        if (session != NULL) {
            
            NSString* digitAuthId = [NSString stringWithFormat:@"%@%@%@%@",@"token=", session.authToken, @",secret=", session.authTokenSecret];
            NSString* phoneNumber = session.phoneNumber;
            NSLog(@"%@,%@",digitAuthId,phoneNumber);
            [self moveMainViewController];
        }else if (error != NULL) {
            NSLog(@"#ERROR : %@", error.description);
        }
    }];
}
-(void)moveMainViewController{
        LCMainViewController *mainVC = [[LCMainViewController alloc]init];
        [self.navigationController pushViewController:mainVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
