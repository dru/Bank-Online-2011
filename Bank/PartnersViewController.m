//
//  PartnersViewController.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "PartnersViewController.h"
#import "PartnersCellView.h"
#import "PartnersWebView.h"

@implementation PartnersViewController

    @synthesize listOfItems;

    - (void)viewDidLoad
    {
        [super viewDidLoad];
        
        self.listOfItems = [[NSMutableArray alloc] init];
        self.navigationItem.title = @"Партнеры";

        // organizers
        NSDictionary *organizers = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"0_kart.jpg", @"http://www.carteblanche-online.info/", nil],
            [NSArray arrayWithObjects:@"0_bc.jpg", @"http://www.banking-class.com.ua/", nil],
            [NSArray arrayWithObjects:@"0_smart.jpg", @"http://www.smart-payments.info/", nil],
            nil] forKey:@"Partners"];        
        [self.listOfItems addObject:organizers];

        // sponsors
        NSDictionary *sponsors = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"1_openway.png", @"http://www.openwaygroup.com/", nil],
            [NSArray arrayWithObjects:@"1_my-gemini.jpg", @"http://www.mygemini.com/", nil],
            [NSArray arrayWithObjects:@"1_bifit.jpg", @"http://www.bifit.ua/", nil],
        nil] forKey:@"Partners"];        
        [self.listOfItems addObject:sponsors];

        // associate
        NSDictionary *associate = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"2_pentegy.gif", @"http://www.pentegy.com/", nil],
        nil] forKey:@"Partners"];        
        [self.listOfItems addObject:associate];

        // partners
        NSDictionary *partners = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"3_uelbu.jpg", @"http://www.uelbu.org/", nil],
            [NSArray arrayWithObjects:@"3_ema.png", @"http://www.ema.com.ua/", nil],
         nil] forKey:@"Partners"];        
        [self.listOfItems addObject:partners];

        // networking
        NSDictionary *networking = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"4_cisbanker.jpg", @"http://www.cisbankers.com/", nil],
        nil] forKey:@"Partners"];        
        [self.listOfItems addObject:networking];

        // internet
        NSDictionary *internet = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"5_bankir.jpg", @"http://www.bankir.ru/", nil],
        nil] forKey:@"Partners"];        
        [self.listOfItems addObject:internet];

        // media
        NSDictionary *media = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"6_banki.gif", @"http://www.banki.ua/", nil],
            [NSArray arrayWithObjects:@"6_bankir.jpg", @"http://www.banksinfo.kiev.ua/", nil],
            [NSArray arrayWithObjects:@"6_ukrnews.jpg", @"http://un.ua/", nil],
            [NSArray arrayWithObjects:@"6_finance.gif", @"http://www.finance.ua/", nil],
            [NSArray arrayWithObjects:@"6_prosto.jpg", @"http://www.prostobank.ua/", nil],
            [NSArray arrayWithObjects:@"6_banker.jpg", @"http://www.banker.ua/", nil],
            [NSArray arrayWithObjects:@"6_itforum.jpg", @"http://www.it-forum.com.ua/", nil],
         nil] forKey:@"Partners"];        
        [self.listOfItems addObject:media];

    }

    - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        
        switch(section) {
            case 0:
                return NSLocalizedString(@"Organizers", @"");
                break;
            case 1:
                return NSLocalizedString(@"Sponsors", @"");
                break;
            case 2:
                return NSLocalizedString(@"Associate sponsor", @"");
                break;
            case 3:
                return NSLocalizedString(@"Partners", @"");
                break;
            case 4:
                return NSLocalizedString(@"Networking Partner", @"");
                break;
            case 5:
                return NSLocalizedString(@"Main Internet Partner", @"");
                break;
            case 6:
                return NSLocalizedString(@"Mediapartners", @"");
                break;
        }
        
        return nil;
    }

    - (void)viewDidUnload
    {
        [super viewDidUnload];
        
        self.listOfItems = nil;
    }

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return [self.listOfItems count];
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        NSDictionary *dictionary = [self.listOfItems objectAtIndex:section];
        NSArray *array = [dictionary objectForKey:@"Partners"];
        return [array count];
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        NSDictionary *dictionary = [self.listOfItems objectAtIndex:indexPath.section];
        NSArray *array = [dictionary objectForKey:@"Partners"];
        
        UIImage *tableCellImage = [UIImage imageNamed:[[array objectAtIndex:indexPath.row] objectAtIndex:0]];
        return tableCellImage.size.height+40;
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        [[NSBundle mainBundle] loadNibNamed:@"PartnersCellView" owner:self options:nil];
        PartnersCellView *cell = tblTableCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        NSDictionary *dictionary = [self.listOfItems objectAtIndex:indexPath.section];
        NSArray *array = [dictionary objectForKey:@"Partners"];

        UIImage *tableCellImage = [UIImage imageNamed:[[array objectAtIndex:indexPath.row] objectAtIndex:0]];
        cell.cellImage.image = tableCellImage;
        [cell.cellImage sizeToFit];
        
        return cell;
    }

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
        PartnersWebView *webView = [[PartnersWebView alloc] initWithNibName:@"PartnersWebView" bundle:nil];

        NSDictionary *dictionary = [self.listOfItems objectAtIndex:indexPath.section];
        NSArray *array = [dictionary objectForKey:@"Partners"];
        webView.currentUrl = [[array objectAtIndex:indexPath.row] objectAtIndex:1];
        self.navigationController.navigationBar.topItem.title = @"Назад";
        
        [self.navigationController pushViewController:webView animated:YES];
        [webView release];
    }

@end
