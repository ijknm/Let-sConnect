//
//  LCAppDelegate.m
//  Let'sConnect
//
//  Created by praveen on 4/12/17.
//  Copyright © 2017 com.Connect. All rights reserved.
//

#import "LCAppDelegate.h"
#import "LCSignInViewController.h"
#import "LCMainViewController.h"
@import GooglePlaces;
@import GoogleMaps;

@interface LCAppDelegate ()

@end

@implementation LCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSPlacesClient provideAPIKey:@"AIzaSyCosSWUu9Ckf0HHKDkMyo8TTsrJ-2iXlag"];
    [GMSServices provideAPIKey:@"AIzaSyCosSWUu9Ckf0HHKDkMyo8TTsrJ-2iXlag"];
    
    [Fabric with:@[[Digits class]]];
    [self loginFabric];
    
    
      // Override point for customization after application launch.
    return YES;
}
-(void)loginFabric{
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
//    LCMainViewController *mainVC = [[LCMainViewController alloc]init];
//    [self.navigationController pushViewController:mainVC animated:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    LCMainViewController *signInVC = [[LCMainViewController alloc] initWithNibName:@"LCMainViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:signInVC];
    self.window.rootViewController = navVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

