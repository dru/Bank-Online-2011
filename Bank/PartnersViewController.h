//
//  PartnersViewController.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartnersCellView.h"
#import "PartnersWebView.h"

@interface PartnersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
        NSMutableArray *listOfItems;
    
        IBOutlet UITableView *tblTable;
        IBOutlet PartnersCellView *tblTableCell;

    }

    @property (nonatomic, retain) NSMutableArray *listOfItems;

@end
