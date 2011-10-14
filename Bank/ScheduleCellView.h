//
//  ScheduleCellView.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/13/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleCellView : UITableViewCell {

        IBOutlet UITextView *cellTitle;
        IBOutlet UILabel *cellCompany;
        IBOutlet UILabel *cellTime;

    }

    @property (nonatomic, retain) IBOutlet UITextView *cellTitle;
    @property (nonatomic, retain) IBOutlet UILabel *cellCompany;
    @property (nonatomic, retain) IBOutlet UILabel *cellTime;

@end
