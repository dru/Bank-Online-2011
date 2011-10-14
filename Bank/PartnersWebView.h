//
//  PartnersWebView.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/12/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartnersWebView : UIViewController <UIWebViewDelegate> {

        IBOutlet UIWebView *browser;
        IBOutlet UIActivityIndicatorView *activityIndicator;
        NSString *currentUrl;
    
    }

    @property (nonatomic, retain) IBOutlet UIWebView *browser;
    @property(nonatomic,retain) UIActivityIndicatorView *activityIndicator;
    @property (nonatomic, retain) NSString *currentUrl;

@end