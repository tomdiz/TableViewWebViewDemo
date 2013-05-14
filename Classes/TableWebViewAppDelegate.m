//
//  TableWebViewAppDelegate.m
//  TableWebView
//
//  Created by Thomas DiZoglio on 4/13/13.
//  Copyright 2013 Virgil Software. All rights reserved.
//

#import "TableWebViewAppDelegate.h"

@implementation TableWebViewAppDelegate

@synthesize window, tableViewCtrl;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [self.window makeKeyAndVisible];
	self.tableViewCtrl.view.frame = self.window.bounds;
	[self.window addSubview: self.tableViewCtrl.view];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
