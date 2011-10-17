//
//  BankAppDelegate.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "BankAppDelegate.h"

@implementation BankAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadNewDataMethod) name:@"newDataAvailable" object:nil];
    
    if ([[Configuration shared] isNewDataAvailable]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"newDataAvailable" object:nil];
    }
    
    return YES;
}

- (void)loadNewDataMethod {
    UIAlertView *loadingAlert = [[UIAlertView alloc] initWithTitle:@"Information" 
                                                           message:@"Do you want to dowload the latest data from server? (You have to start app again after update)"
                                                          delegate:self cancelButtonTitle:@"NO" 
                                                 otherButtonTitles:@"YES", nil];
    loadingAlert.delegate = self;
    [loadingAlert show];
    [loadingAlert autorelease];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"do not download data");
    } else {
        [[Configuration shared] loadNewDataFromServer];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
