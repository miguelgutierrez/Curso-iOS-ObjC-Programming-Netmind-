//
//  ELBLocalizacionViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBLocalizacionViewController.h"
#import "ELBAnotacion.h"

@interface ELBLocalizacionViewController ()
- (void) setLocation;
- (void) cargarAnotaciones;

@end

@implementation ELBLocalizacionViewController
@synthesize mapaMapView=_mapaMapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _mapaMapView.showsUserLocation=YES;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLocation];
    [self cargarAnotaciones];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *const pinIdentifier=@"pinMapa";
    
    if ([annotation isKindOfClass:[ELBAnotacion class]]) {
        MKPinAnnotationView *pin = (MKPinAnnotationView *) [_mapaMapView dequeueReusableAnnotationViewWithIdentifier: pinIdentifier];
        if (pin == nil) {
            pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        }
        else {
            pin.annotation = annotation;
        }
        pin.pinColor = MKPinAnnotationColorRed;
        pin.canShowCallout = YES;
        pin.animatesDrop = NO;

        return pin;
    }
    return nil;
}

#pragma mark - CLLocationManagerDelegate
/*
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateRegion  userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 5000.0, 5000.0);

    // para que deje de consumir recursos
    [_locationManager stopUpdatingLocation];
    
    [_mapaMapView setRegion:userLocation animated:YES];
    
}
#pragma mark - funciones auxiliares
- (void) setLocation
{
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized) {
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        
        [_locationManager startUpdatingLocation];
    }
}
- (void)cargarAnotaciones
{
    CLLocationCoordinate2D coordenadasMiCasa;
    coordenadasMiCasa.latitude=40.4034937;
    coordenadasMiCasa.longitude=-3.7144109;
    ELBAnotacion *anotacion = [[ELBAnotacion alloc] initConCoordenada:coordenadasMiCasa];
    
    [_mapaMapView addAnnotation:anotacion];
}
@end
