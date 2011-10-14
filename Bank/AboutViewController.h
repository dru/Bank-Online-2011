//
//  AboutViewController.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutCellView.h"

@interface AboutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

        NSMutableArray *listOfItems;

        IBOutlet UITableView *tblTable;
        IBOutlet AboutCellView *tblTableCell;

    }

    @property (nonatomic, retain) NSMutableArray *listOfItems;

@end
