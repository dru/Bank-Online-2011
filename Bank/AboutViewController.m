//
//  AboutViewController.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutCellView.h"

@implementation AboutViewController

    @synthesize listOfItems;

    - (void)viewDidLoad
    {
        [super viewDidLoad];
     
        self.listOfItems = [[NSMutableArray alloc] init];
        
        NSDictionary *first = [NSDictionary dictionaryWithObject:
       [NSArray arrayWithObjects:
           [NSArray arrayWithObjects:@"", @"Описание", @"Банк Online 2011 - первая в Украине конференция, полностью посвященная инновациям и современным тенденциям в области дистанционного банковского обслуживания (ДБО)", nil],
            [NSArray arrayWithObjects:@"", @"Где и когда", @"25-26 октября 2011 года\nАдрес: Украина, г.Киев, ул. Шолуденко 3, Cubic Center, конференц зал Панорама\nБизнес центр «Кубик Центр» расположен в деловом центре г. Киева, в престижном Шевченковском районе города\n\nТранспортная доступность:\nВ пяти минутах ходьбы от станции метро Политехнический институт \nВ десяти минутах ходьбы от станции метро Лукьяновская\nЕсть парковка                             ", nil],
        nil] forKey:@"Items"];
        [self.listOfItems addObject:first];

        NSDictionary *second = [NSDictionary dictionaryWithObject:
        [NSArray arrayWithObjects:
            [NSArray arrayWithObjects:@"1.jpg", @"Журнал «Карт Бланш»", @"Специализированное издание  развития рынка новейших банковских технологий, платежных карточек и расчетов, платежей и переводов.", nil],
            [NSArray arrayWithObjects:@"2.jpg", @"Банкинг Класс", @"Консалтинговая компания и современный учебный центр для специалистов финансовой сферы. Компания предоставляет банкам и другим финансовым учреждениям услуги по обучению и повышению квалификации различных категорий сотрудников, а также услуги по консалтингу в области розничных финансовых продуктов. Специализированное издание  развития рынка новейших банковских технологий, платежных карточек и расчетов, платежей и переводов.", nil],
            [NSArray arrayWithObjects:@"3.jpg", @"Информационный портал Smart Payments", @"Источник актуальной информации – для профессионалов\nПлатежи: карточные, электронные, Интернет и мобильные.  Технологии: ID, NFC, RFID. Решения: IT, CRM, ERP. Инновации. Опыт. Бизнес. Соцпроекты\nПоддержка Проекта была осуществлена Европейским Банком Реконструкции и Развития в рамках Программы деловых консультаций ЕБРР", nil],
        nil] forKey:@"Items"];
        [self.listOfItems addObject:second];

        NSDictionary *third = [NSDictionary dictionaryWithObject:
       [NSArray arrayWithObjects:
           [NSArray arrayWithObjects:@"", @"Тарас Волобуев", @"Банкинг Класс\nтел.: +38 044 537 16 10\nмоб.: +38 067 402 32 83\ntv@banking-class.com.ua", nil],
           [NSArray arrayWithObjects:@"", @"Елена Голембовская", @"Журнал \"Карт Бланш\"\nтел.: +38 044 286 38 54\nмоб.: + 38 050 334 74 58\nelena@carteblanche-online.info", nil],
        nil] forKey:@"Items"];
        [self.listOfItems addObject:third];
    }

    - (void)viewDidUnload
    {
        [super viewDidUnload];
        self.listOfItems = nil;
    }

    - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        
        switch(section) {
            case 0:
                return @"О событии";
                break;
            case 1:
                return @"Организаторы";
                break;
            case 2:
                return @"Оргкомитет";
                break;
        }
        
        return nil;
    }

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return [self.listOfItems count];
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        NSDictionary *dictionary = [self.listOfItems objectAtIndex:section];
        NSArray *array = [dictionary objectForKey:@"Items"];
        return [array count];
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        NSDictionary *dictionary = [self.listOfItems objectAtIndex:indexPath.section];
        NSArray *array = [[dictionary objectForKey:@"Items"] objectAtIndex:indexPath.row];
        
        NSString *image = [array objectAtIndex:0];
        NSString *descr = [array objectAtIndex:2];
        return MAX(ceilf(descr.length/(image == @"" ? 20 : 12))*13+40, 120);
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        [[NSBundle mainBundle] loadNibNamed:@"AboutCellView" owner:self options:nil];
        AboutCellView *cell = tblTableCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        NSDictionary *dictionary = [self.listOfItems objectAtIndex:indexPath.section];
        NSArray *array = [[dictionary objectForKey:@"Items"] objectAtIndex:indexPath.row];
        
        NSString *image = [array objectAtIndex:0];
        if(image != @"") {            
            UIImage *tableCellImage = [UIImage imageNamed:image];
            cell.cellImage.image = tableCellImage;
            [cell.cellImage sizeToFit];
        }else{
            cell.cellImage.hidden = YES;
            CGRect frame = [cell.cellDescr frame];
            frame.origin.x = 12;
            frame.size.width = self.view.frame.size.width-24;
            cell.cellDescr.frame = frame;
        }

        NSString *title = [array objectAtIndex:1];
        cell.cellTitle.text = title;

        NSString *descr = [array objectAtIndex:2];
        cell.cellDescr.text = descr;
        CGRect frame = [cell.cellDescr frame];
        frame.size.height = MAX(ceilf(descr.length/(image == @"" ? 20 : 12))*13+5, 80);
        cell.cellDescr.frame = frame;

        return cell;
    }

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        

    }

@end
