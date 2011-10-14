//
//  MapViewControllerPin.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "MapViewControllerPin.h"

@implementation MapViewControllerPin

    @synthesize coordinate;

    -(id)initWithCoordinate:(CLLocationCoordinate2D) c{
        coordinate=c;
        return self;
    }

    - (NSString *)title{
        return NSLocalizedString(@"Map Address", @"");
    }

    - (NSString *)subtitle{
        return NSLocalizedString(@"Map Description", @"");
    }

@end
