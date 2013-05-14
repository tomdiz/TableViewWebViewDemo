//
//  TableViewCtrl.m
//  TableWebView
//
//  Created by Thomas DiZoglio on 4/13/13.
//  Copyright 2013 Virgil Software. All rights reserved.
//

#import "TableViewCtrl.h"
#import "UISynchedWebView.h"

@implementation TableViewCtrl

#pragma mark -
#pragma mark View lifecycle

@synthesize urls;

-(id) initWithCoder:(NSCoder *)aDecoder
{
	if((self = [super initWithCoder:aDecoder]) != nil)
	{
		lock = [[NSLock alloc] init];
	}
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urls = [NSArray arrayWithObjects:@"http://www.google.com",@"",@"http://www.vurb.com",nil];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"VurbWebViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIWebView* webView = [[UISynchedWebView alloc] initWithFrame:
							  CGRectMake(10, 10, cell.bounds.size.width - 20, cell.bounds.size.height - 20)];
		webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
		webView.tag = 1001;
		webView.userInteractionEnabled = NO;
		webView.backgroundColor = [UIColor clearColor];
		webView.opaque = NO;

		
		[cell addSubview:webView];
		[webView release];
    }
    
	UIWebView* webView = (UIWebView*)[cell viewWithTag:1001];
	webView.delegate = self;
	
	NSLog(@"current mode: %@", [[NSRunLoop currentRunLoop] currentMode]);
	
    NSString *urlString = [urls objectAtIndex:indexPath.row];
    
    if ([urlString isEqualToString:@""]) {
        [webView loadHTMLString: [NSString stringWithFormat:@"<head><body style=”background-color:transparent”><head><body>\
							  <i>Sample HTML that could be</i><b> Preloaded</b> <span style = \"font-size:120%%\">locally before shown</span><br>row number: <b>%d</b></body>", indexPath.row] baseURL:nil];
    }
    else {
        NSURL *url = [NSURL URLWithString:[urls objectAtIndex:indexPath.row]];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
	
	return cell;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 400;
}

#pragma mark -
#pragma mark Table view delegate


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

- (void)dealloc {
	[lock release];
    [super dealloc];
}


@end

