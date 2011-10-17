//
//  Configuration.h
//  Bank Online 2011
//
//  Created by Андрей Мельник on 17.10.11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface Configuration : NSObject {
    NSDictionary *data;
    NSNumber     *version;
    NSMutableData *receivedData;
}

@property (nonatomic, retain) NSDictionary *data;
@property (nonatomic, retain) NSNumber *version;

+(Configuration*)shared;
-(void)savePrefs:(NSString *)path;
-(BOOL)isNewDataAvailable;
-(void)loadNewDataFromServer;

@end

