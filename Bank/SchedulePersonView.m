//
//  SchedulePersonView.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/14/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import "SchedulePersonView.h"

@implementation SchedulePersonView

    @synthesize array;
    @synthesize itemPicture;
    @synthesize itemAuthor;
    @synthesize itemPosition;
    @synthesize itemCompany;
    @synthesize itemDescription;


    - (void)viewDidLoad
    {
        [super viewDidLoad];

        if([[array objectForKey:@"picture"] length]) {
            UIImage *image = [UIImage imageNamed:[array objectForKey:@"picture"]];
            itemPicture.image = image;
            [itemPicture sizeToFit];
        }else{
            CGRect authorFrame = [itemAuthor frame];
            authorFrame.size.width = 300;
            authorFrame.origin.x = 20;
            itemAuthor.frame = authorFrame;            

            CGRect positionFrame = [itemPosition frame];
            positionFrame.size.width = 300;
            positionFrame.origin.x = 20;
            itemPosition.frame = positionFrame;            

            CGRect companyFrame = [itemCompany frame];
            companyFrame.size.width = 300;
            companyFrame.origin.x = 20;
            itemCompany.frame = companyFrame;
        }

        itemAuthor.text = [array objectForKey:@"author"];
        itemPosition.text = [array objectForKey:@"position"];
        itemCompany.text = [array objectForKey:@"company"];
        itemDescription.text = [array objectForKey:@"description"];
        
    }

    - (void)viewDidUnload
    {
        [super viewDidUnload];
    }

@end
