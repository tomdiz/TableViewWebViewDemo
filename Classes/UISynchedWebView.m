//
//  TableWebView.m
//  TableWebView
//
//  Created by Thomas DiZoglio on 4/13/13.
//  Copyright 2013 Virgil Software. All rights reserved.
//

#import "UISynchedWebView.h"

@implementation UISynchedWebView

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	[self performSelector:@selector(stopRunLoop) withObject:nil afterDelay:.01];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	return YES;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
	[self performSelector:@selector(stopRunLoop) withObject:nil afterDelay:.01];
}

-(void) stopRunLoop
{
	CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
	CFRunLoopStop(runLoop);
}

-(void) webViewDidStartLoad:(UIWebView *)webView
{
}

-(void) loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
	[super loadHTMLString:string baseURL:baseURL];
	CFRunLoopRunInMode((CFStringRef)NSDefaultRunLoopMode, 1, NO);
}

-(void) loadRequest:(NSURLRequest *)request
{
	[super loadRequest:request];
	CFRunLoopRunInMode((CFStringRef)NSDefaultRunLoopMode, 1, NO);
}

@end
