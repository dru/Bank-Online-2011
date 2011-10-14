//
//  SchedulePersonView.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/14/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchedulePersonView : UIViewController {

        NSDictionary *array;

        IBOutlet UIImageView *itemPicture;
        IBOutlet UILabel *itemAuthor;
        IBOutlet UILabel *itemPosition;
        IBOutlet UILabel *itemCompany;
        IBOutlet UITextView *itemDescription;
    }

    @property (nonatomic, retain) NSDictionary *array;
    @property (nonatomic, retain) IBOutlet UIImageView *itemPicture;
    @property (nonatomic, retain) IBOutlet UILabel *itemAuthor;
    @property (nonatomic, retain) IBOutlet UILabel *itemPosition;
    @property (nonatomic, retain) IBOutlet UILabel *itemCompany;
    @property (nonatomic, retain) IBOutlet UITextView *itemDescription;

@end
