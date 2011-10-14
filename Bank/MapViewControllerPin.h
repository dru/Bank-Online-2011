//
//  MapViewControllerPin.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewControllerPin : NSObject<MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;

}

@property (nonatomic, readonly)

    CLLocationCoordinate2D coordinate;

    -   (id)         initWithCoordinate:(CLLocationCoordinate2D) coordinate;
    -   (NSString *) title;
    -   (NSString *) subtitle;

@end
