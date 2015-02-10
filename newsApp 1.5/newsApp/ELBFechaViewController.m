//
//  ELBFechaViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 17/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBFechaViewController.h"
#import "ELBArticuloViewController.h"

@interface ELBFechaViewController ()

@property (strong, nonatomic) IBOutlet UIDatePicker *fechaDatePicker;

- (void)actualizaFecha;
- (IBAction)cerrar:(id)sender;

@end

@implementation ELBFechaViewController

@synthesize fechaDatePicker=_fechaDatePicker;
@synthesize delegate=_delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)actualizaFecha
{
    if (_delegate) {
        [(ELBArticuloViewController *)_delegate setFecha:(_fechaDatePicker.date)];
        /*
        NSDate *fecha = ((UIDatePicker *)sender).date;
        [(ELBArticuloViewController *)_delegate setFecha:fecha];
        */
    }
}

- (IBAction)cerrar:(id)sender
{
    [self actualizaFecha];

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
