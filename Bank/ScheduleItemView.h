//
//  ScheduleItemView.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/13/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchedulePersonView.h"
#import "SBJson.h"
#import "Data.h"

@interface ScheduleItemView : UIViewController {

        NSDictionary *array;
    
        IBOutlet UILabel *itemTime;
        IBOutlet UILabel *itemTitle;
        IBOutlet UIButton *itemGoAuthor;
        IBOutlet UILabel *itemAuthor;
        IBOutlet UILabel *itemCompany;
        IBOutlet UIButton *itemGoAuthorBtn;
        IBOutlet UITextView *itemDescription;
    }

    @property (nonatomic, retain) NSDictionary *array;
    @property (nonatomic, retain) IBOutlet UILabel *itemTime;
    @property (nonatomic, retain) IBOutlet UILabel *itemTitle;
    @property (nonatomic, retain) IBOutlet UIButton *itemGoAuthor;
    @property (nonatomic, retain) IBOutlet UILabel *itemAuthor;
    @property (nonatomic, retain) IBOutlet UILabel *itemCompany;
    @property (nonatomic, retain) IBOutlet UIButton *itemGoAuthorBtn;
    @property (nonatomic, retain) IBOutlet UITextView *itemDescription;

@end
