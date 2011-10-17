//
//  ScheduleViewController.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Configuration.h"
#import "ScheduleCellView.h"
#import "ScheduleItemView.h"

@interface ScheduleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

        NSDictionary *data;
        NSString *currentDate;
        int currentRow;
        int currentCell;

        UISegmentedControl *segmentedControl;
        IBOutlet UITableView *tblTable;
        IBOutlet ScheduleCellView *tblTableCell;
    }

    @property (nonatomic, retain) NSDictionary *data;
    @property (nonatomic, retain) NSString *currentDate;
    @property (nonatomic) int currentRow;
    @property (nonatomic) int currentCell;
    @property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;

    -(IBAction) segmentedControlIndexChanged;

@end
