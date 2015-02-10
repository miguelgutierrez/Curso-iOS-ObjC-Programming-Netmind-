//
//  ELBMovimientoViewController.m
//  funnyApp
//
//  Created by Miguel Gutiérrez Moreno on 14/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBMovimientoViewController.h"

@interface ELBMovimientoViewController ()

- (void) seHaMovido:(NSNotification *)notificacion;

@end

@implementation ELBMovimientoViewController

@synthesize movimientoLabel=_movimientoLabel;
@synthesize gestosLabel=_gestosLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(seHaMovido:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder]; // necesario para gestionar shake
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)seHaMovido:(NSNotification *)notificacion
{
    UIDeviceOrientation orientacion = [[UIDevice currentDevice] orientation];
    
    switch (orientacion) {
        case UIDeviceOrientationFaceUp:
            _movimientoLabel.text=@"UIDeviceOrientationFaceUp";
            break;
        case UIDeviceOrientationFaceDown:
            _movimientoLabel.text=@"UIDeviceOrientationFaceDown";
            break;
        case UIDeviceOrientationPortrait:
            _movimientoLabel.text=@"UIDeviceOrientationPortrait";
            break;
        case UIDeviceOrientationLandscapeRight:
            _movimientoLabel.text=@"UIDeviceOrientationLandscapeRight";
            break;
            
        default:
            _movimientoLabel.text=@"otros";
            break;
    }

}
/* PROCESO
 - el usuario ha movido el/los dedo/s hacia un lado: right,left,up, down:
 * lo he puesto a 2 touch
 -
 */
- (IBAction)swipe:(id)sender
{
    NSString *movimiento = [NSString stringWithFormat:@"El usuario ha movido los dedos "];
    UISwipeGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateEnded){
        _gestosLabel.text=movimiento;
    }

}
/* PROCESO
 - el usuario ha pulsado en la ventana
 -
 */
- (IBAction)tap:(id)sender
{
    NSString *movimiento = [NSString stringWithFormat:@"Ha pulsado la ventana"];
    UITapGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateEnded){
        _gestosLabel.text=movimiento;
        
    }
}

- (IBAction)rotation:(id)sender
{
    UIRotationGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateBegan){
        _gestosLabel.text= @"el usuario ha empezado a rotar";
        
    }
    else
        if(gesto.state == UIGestureRecognizerStateEnded){
            _gestosLabel.text= @"el usuario ha acabado de rotar ";
            
        }
}
/*
 El usuario "pellizca" con los dedos
 */
- (IBAction)pinch:(id)sender
{
    NSString *movimiento = [NSString stringWithFormat:@"Ha pellizado la ventana"];
    UIPinchGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateEnded){
        _gestosLabel.text=movimiento;
        
    }
}
/* PROCESO
 - el usuario ha  movido el dedo en la ventana en cualquier dirección
 -  Si se incluye este gesto no funciona el de Swipe
 */

- (IBAction)pan:(id)sender
{
    
    UIPanGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateBegan){
        _gestosLabel.text= @"el usuario ha empezado a mover los dedos ";
        
    }
    else
        if(gesto.state == UIGestureRecognizerStateEnded){
            _gestosLabel.text= @"el usuario ha acabado de mover los dedos ";
        
        }
    
}
/* PROCESO
 - el usuario ha mantenido presionado el dedo en la ventana
 -
 */


- (IBAction)longPress:(id)sender
{
    UILongPressGestureRecognizer *gesto=sender;
    if(gesto.state == UIGestureRecognizerStateBegan){
        _gestosLabel.text= @"el usuario ha empezado a presionar los dedos ";
        
    }
    else
        if(gesto.state == UIGestureRecognizerStateEnded){
            _gestosLabel.text= @"el usuario ha acabado de presionar los dedos ";
            
        }
    
}
/* PROCESO
 - el usuario ha agitado el dispositivo
 -
 */
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    _movimientoLabel.text=@"Se ha agitado";

}
/* PROCESO
 -  necesario para shake/motionEnded
 -
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
