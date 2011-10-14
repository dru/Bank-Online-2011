//
//  AboutCellView.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/12/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutCellView : UITableViewCell {

        IBOutlet UIImageView *cellImage;
        IBOutlet UILabel *cellTitle;
        IBOutlet UITextView *cellDescr;

    }

    @property (nonatomic, retain) IBOutlet UIImageView *cellImage;
    @property (nonatomic, retain) IBOutlet UILabel *cellTitle;
    @property (nonatomic, retain) IBOutlet UITextView *cellDescr;

@end
