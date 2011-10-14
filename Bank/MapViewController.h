//
//  MapViewController.h
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "MapViewControllerPin.h"

@interface MapViewController : UIViewController {

    MKMapView *mapView;
    
}

@end