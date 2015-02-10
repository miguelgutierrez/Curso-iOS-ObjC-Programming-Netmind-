//
//  ELBLocalizacionViewController.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ELBLocalizacionViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapaMapView;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end
