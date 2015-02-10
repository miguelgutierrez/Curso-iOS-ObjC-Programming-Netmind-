//
//  ELBFirstViewController.m
//  funnyApp
//
//  Created by Miguel Gutiérrez Moreno on 08/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBFirstViewController.h"

@interface ELBFirstViewController ()

@property (strong, nonatomic) IBOutlet UISlider *trasparenciaSlider;
@property (strong, nonatomic) IBOutlet UIStepper *velocidadStepper;
@property (strong, nonatomic) IBOutlet UIImageView *portadaImageView;

- (IBAction)setTrasparencia:(id)sender;
- (IBAction)setDuracionMovimiento:(id)sender;

@end

@implementation ELBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setTrasparencia:(id)sender
{

    NSLog(@"valor %f",((UISlider*)sender).value);
    
    [_portadaImageView setAlpha:((UISlider*)sender).value];
    
}

/*
 Ejercicio: 
  - desarrollar el control de recibir un nuevo action cuanto todavía se está ejecutando el animateWithDuration

 */
- (IBAction)setDuracionMovimiento:(id)sender {

    NSLog(@"valor %f",((UIStepper*)sender).value);

    [_portadaImageView setCenter:CGPointMake(160,120)];

    NSTimeInterval tiempoDuracion= ((UIStepper*)sender).value;
    
    [UIView animateWithDuration:tiempoDuracion
                     animations:^{
                         
                         [_portadaImageView setCenter:CGPointMake(300,500)];
                         
                     } completion:^(BOOL finished) {
                         [_portadaImageView setCenter:CGPointMake(160,120)];
                         NSLog(@"Valor de finished: %i",finished);
                     }];

    NSLog(@"Fin setDuracionMovimiento. No ha acabado animateWithDuration");
}
@end
