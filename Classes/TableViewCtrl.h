//
//  TableViewCtrl.h
//  TableWebView
//
//  Created by Thomas DiZoglio on 4/13/13.
//  Copyright 2013 Virgil Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCtrl : UITableViewController  <UIWebViewDelegate>
{
	NSLock* lock;
}

@property (nonatomic, strong) NSArray *urls;

@end
