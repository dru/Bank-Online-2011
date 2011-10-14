//
//  ScheduleViewController.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleCellView.h"
#import "ScheduleItemView.h"
#import "Data.h"

@implementation ScheduleViewController

    @synthesize data;
    @synthesize currentDate;
    @synthesize segmentedControl;
    @synthesize currentRow;
    @synthesize currentCell;

    - (void)viewDidLoad
    {
        [super viewDidLoad];
        
        NSDateFormatter *formatter;
        NSString        *dateString;
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy"];
        dateString = [formatter stringFromDate:[NSDate date]];
        [formatter release];
        
        if(![dateString compare:@"26-10-2011"]) {
            self.segmentedControl.selectedSegmentIndex = 1;
        }
        [self segmentedControlIndexChanged];
        
        if(![dateString compare:@"25-10-2011"] || ![dateString compare:@"26-10-2011"]) {
            double now = [[NSDate date] timeIntervalSince1970];
            double max = 0;

            for(NSString *group in [self.data objectForKey:@"schedule"]) {
                for(int i = 1; i < [[[self.data objectForKey:@"schedule"] objectForKey:group] count]; i++) {
                    NSDictionary *item = [[[self.data objectForKey:@"schedule"] objectForKey:group] objectAtIndex:i];
                    double time = [[item objectForKey:@"start"] doubleValue];
                    
                    if(time < now && time > max) {
                        self.currentRow = (NSInteger)[group intValue]-1;
                        self.currentCell = (NSInteger)i-1;

                        max = time;
                    }
                }
            } 
        }
    }

    -(void)viewDidAppear:(BOOL)animated{
        if(self.currentCell != 0 || self.currentRow != 0) {
            [tblTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentCell inSection:self.currentRow] atScrollPosition:UITableViewScrollPositionTop animated:YES];                    
        }
    }

    - (void)viewDidUnload {
        [super viewDidUnload];

        self.data = nil;
    }

    -(IBAction) segmentedControlIndexChanged{
        switch (self.segmentedControl.selectedSegmentIndex) {
            case 0:
                self.currentDate = @"2011-10-25";
                break;
            case 1:
                self.currentDate = @"2011-10-26";
                break;
            default:
                break;
        }

        SBJsonParser *parser = [SBJsonParser new];
        self.data = [[[parser objectWithString:DATA] objectForKey:@"data"] objectForKey:self.currentDate];
        [parser release];
        //#NSLog(@"%@", parser.error);        
        
        [tblTable reloadData];
    }

    - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        NSString *index = [NSString stringWithFormat:@"%u", section+1];
        return [[self.data objectForKey:@"sections"] objectForKey:index];
    }

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return [[self.data objectForKey:@"sections"] count];
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        NSString *index = [NSString stringWithFormat:@"%u", section+1];
        return [[[self.data objectForKey:@"schedule"] objectForKey:index] count];
    }

    - (CGSize)getSizeOfText:(NSString *)text withFont:(UIFont *)font
    {
        return [text sizeWithFont:font constrainedToSize:CGSizeMake(280, 640)];
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        NSString *section = [NSString stringWithFormat:@"%u", indexPath.section+1];
        NSDictionary *array = [[[self.data objectForKey:@"schedule"] objectForKey:section] objectAtIndex:indexPath.row];
        int height = 0;

        NSString *title = [array objectForKey:@"title"];
        if([title length] != 0) {
            CGSize titleSize = [self getSizeOfText:title withFont:[UIFont boldSystemFontOfSize:16]];
            if(titleSize.height != 0) {
                height = height + round(titleSize.height);
            }

            height += 70;
        }else{
            height = 60;
        }
        
        return height;
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        NSString *section = [NSString stringWithFormat:@"%u", indexPath.section+1];
        NSDictionary *array = [[[self.data objectForKey:@"schedule"] objectForKey:section] objectAtIndex:indexPath.row];

        [[NSBundle mainBundle] loadNibNamed:@"ScheduleCellView" owner:self options:nil];
        ScheduleCellView *cell = tblTableCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        // title
        NSString *title = [array objectForKey:@"title"];
        cell.cellTitle.font = [UIFont boldSystemFontOfSize:16];

        if([title length] != 0) {
            // set size
            CGSize titleSize = [self getSizeOfText:title withFont:[UIFont systemFontOfSize:16]];
            CGRect titleFrame = [cell.cellTitle frame];
            titleFrame.size.height = titleSize.height+10;
            cell.cellTitle.frame = titleFrame;

            CGRect companyFrame = [cell.cellCompany frame];
            companyFrame.origin.y = titleSize.height+15;
            cell.cellCompany.frame = companyFrame;

            CGRect timeFrame = [cell.cellCompany frame];
            timeFrame.origin.y = titleSize.height+40;
            cell.cellTime.frame = timeFrame;

            cell.cellTitle.text = title;
        }else{
            NSString *author = [array objectForKey:@"author"];

            // set size
            CGRect titleFrame = [cell.cellTitle frame];
            titleFrame.size.height = 30;
            cell.cellTitle.frame = titleFrame;

            cell.cellCompany.hidden = YES;

            CGRect timeFrame = [cell.cellCompany frame];
            timeFrame.origin.y = 30;
            cell.cellTime.frame = timeFrame;
        
            cell.cellTitle.text = author;  
        }


        // company
        NSString *company = [array objectForKey:@"company"];
        if([company length] != 0) {
            cell.cellCompany.text = company;            
        }

        // time
        NSString *start = [array objectForKey:@"start"];
        NSString *end = [array objectForKey:@"end"];

        NSDate *date_start = [NSDate dateWithTimeIntervalSince1970:[start doubleValue]];
        NSDate *date_end = [NSDate dateWithTimeIntervalSince1970:[end doubleValue]];

        NSDateFormatter *dateFormatStart = [[NSDateFormatter alloc] init];
        [dateFormatStart setDateFormat:@"hh:mm"];
        NSString *str_start = [dateFormatStart stringFromDate:date_start];
        [dateFormatStart release];

        NSDateFormatter *dateFormatEnd = [[NSDateFormatter alloc] init];
        [dateFormatEnd setDateFormat:@"hh:mm"];
        NSString *str_end = [dateFormatEnd stringFromDate:date_end];
        [dateFormatEnd release];

        cell.cellTime.text = str_start;
        if(str_start != str_end) {
            cell.cellTime.text = [NSString stringWithFormat:@"%@ — %@", str_start, str_end];
        }

        return cell;
    }

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        NSString *section = [NSString stringWithFormat:@"%u", indexPath.section+1];
        NSDictionary *array = [[[self.data objectForKey:@"schedule"] objectForKey:section] objectAtIndex:indexPath.row];

        // title
        NSString *title = [array objectForKey:@"title"];        
        if([title length] != 0) {
            
            ScheduleItemView *itemView = [[ScheduleItemView alloc] initWithNibName:@"ScheduleItemView" bundle:nil];
            
            self.navigationController.navigationBar.topItem.title = @"Назад";
            itemView.array = array;
            
            [self.navigationController pushViewController:itemView animated:YES];
            [itemView release];
        }
    }

@end
