//
//  ELBDetalleArticuloViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBDetalleArticuloViewController.h"
#import "ELBArticulo.h"

@interface ELBDetalleArticuloViewController ()

- (void) grabaUserDefaults;

@property NSString *articuloString;
@end

@implementation ELBDetalleArticuloViewController

@synthesize articuloTextView=_articuloTextView;
@synthesize articuloString=_articuloString;

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
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _articuloTextView.text=_articuloString;
}
#pragma mark - eventos
- (IBAction)cerrar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - funciones auxiliares
-(void)setArticulo:(ELBArticulo *)articulo
{
    NSDateFormatter *fechaFormatter = [[NSDateFormatter alloc] init];
	[fechaFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];

    NSString *texto= [NSString stringWithFormat:@"Escritor: %@  Fecha: %@ \n Artículo: %@",
                      articulo.nombre,
                      [fechaFormatter stringFromDate:articulo.fecha],
                      articulo.texto];

    [self setTextoArticulo:texto];
}
-(void)setTextoArticulo:(NSString *)texto
{
    _articuloString=texto;
    _articuloTextView.text=_articuloString;

}
-(void)grabaUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"lecturasDeArticulos"];
    [userDefaults synchronize];
}

@end
