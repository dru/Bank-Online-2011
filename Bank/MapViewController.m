//
//  MapViewController.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/11/11.
//  Copyright 2011 Unteleported. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // create map
    CGRect viewBounds = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-93);
    mapView = [[MKMapView alloc] initWithFrame:viewBounds];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    CLLocationCoordinate2D location=mapView.userLocation.coordinate;    

    // set params
    span.latitudeDelta=0.008;
    span.longitudeDelta=0.008;
    location.latitude=50.452663;
    location.longitude=30.477559;
    region.span=span;
    region.center=location;
    
    // add pin
    MapViewControllerPin *annotation = [[[MapViewControllerPin alloc] initWithCoordinate:location] autorelease];

    // show all
    [mapView setRegion:region animated:FALSE];
    [mapView addAnnotation:annotation];
    
    [self.view addSubview:mapView];    
    [mapView selectAnnotation:annotation animated:FALSE];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	annView.animatesDrop=YES;
	return annView;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
