//
//  TableWebViewAppDelegate.h
//  TableWebView
//
//  Created by Thomas DiZoglio on 4/13/13.
//  Copyright 2013 Virgil Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCtrl.h"

@interface TableWebViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TableViewCtrl* tableViewCtrl;

@end

