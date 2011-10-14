//
//  PartnersWebView.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/12/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import "PartnersWebView.h"

@implementation PartnersWebView

    @synthesize browser;
    @synthesize activityIndicator;
    @synthesize currentUrl;

    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
        }
        return self;
    }

    - (void)didReceiveMemoryWarning
    {
        // Releases the view if it doesn't have a superview.
        [super didReceiveMemoryWarning];
    }

    #pragma mark - View lifecycle

    - (void)viewDidLoad
    {
        [super viewDidLoad];

        browser.delegate = self;
        NSURL *url = [NSURL URLWithString:self.currentUrl];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.browser loadRequest:requestObj];
    }

    - (void)webViewDidStartLoad:(UIWebView *)webView {        
        activityIndicator.hidden = NO;
        [activityIndicator startAnimating];
    }

    - (void)webViewDidFinishLoad:(UIWebView *)webView {
        activityIndicator.hidden = YES;
        [activityIndicator stopAnimating];
    }

    - (void)viewDidUnload
    {
        [super viewDidUnload];
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;        
    }

    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        // Return YES for supported orientations
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }

    -(void)dealloc
    {
        [super dealloc];

        browser.delegate = nil;
    }

@end
