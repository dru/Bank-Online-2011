//
//  Schedulem
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/13/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import "ScheduleItemView.h"

@implementation ScheduleItemView

    @synthesize array;
    @synthesize itemTime;
    @synthesize itemTitle;
    @synthesize itemGoAuthor;
    @synthesize itemAuthor;
    @synthesize itemCompany;
    @synthesize itemGoAuthorBtn;
    @synthesize itemDescription;

    - (void)viewDidLoad
    {
        [super viewDidLoad];

        // time
        NSString *start = [array objectForKey:@"start"];
        NSString *end = [array objectForKey:@"end"];
        
        NSDate *date_start = [NSDate dateWithTimeIntervalSince1970:[start doubleValue]];
        NSDate *date_end = [NSDate dateWithTimeIntervalSince1970:[end doubleValue]];
        
        NSDateFormatter *dateFormatStart = [[NSDateFormatter alloc] init];
        [dateFormatStart setDateFormat:@"HH:mm"];
        NSString *str_start = [dateFormatStart stringFromDate:date_start];
        [dateFormatStart release];
        
        NSDateFormatter *dateFormatEnd = [[NSDateFormatter alloc] init];
        [dateFormatEnd setDateFormat:@"HH:mm"];
        NSString *str_end = [dateFormatEnd stringFromDate:date_end];
        [dateFormatEnd release];
        
        itemTime.text = str_start;
        if(str_start != str_end) {
            itemTime.text = [NSString stringWithFormat:@"%@ — %@", str_start, str_end];
        }

        itemTitle.font = [UIFont boldSystemFontOfSize:14];
        itemTitle.text = [array objectForKey:@"title"];

        itemAuthor.text = [array objectForKey:@"author"];
        itemCompany.text = [array objectForKey:@"company"];
        itemDescription.text = [array objectForKey:@"description"]; 
        

        NSDictionary *authors = [[[Configuration shared] data] objectForKey:@"authors"];
        
        NSDictionary *info = [authors objectForKey:[[array objectForKey:@"author"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        
        if([[info objectForKey:@"author"] length] != 0) {
            [itemGoAuthor addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
            [itemGoAuthorBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
        }else{
            itemGoAuthor.hidden = YES;
            itemGoAuthorBtn.hidden = YES;
        }
    }

    - (void)viewDidUnload
    {
        [super viewDidUnload];
    }

    - (IBAction)buttonClicked:(id)sender {        
        // author
        NSString *author = [array objectForKey:@"author"];        
        if([author length] != 0) {
            
            SchedulePersonView *itemView = [[SchedulePersonView alloc] initWithNibName:@"SchedulePersonView" bundle:nil];
            
            
            itemView.array = [[[[Configuration shared] data] objectForKey:@"authors"] objectForKey:[author stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
            
            
            if([[itemView.array objectForKey:@"author"] length] != 0) {
                [self.navigationController pushViewController:itemView animated:YES];
                [itemView release];                
            }            
        }
    }
@end
