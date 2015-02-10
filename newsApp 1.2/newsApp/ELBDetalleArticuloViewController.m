//
//  ELBDetalleArticuloViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBDetalleArticuloViewController.h"

@interface ELBDetalleArticuloViewController ()

@property (strong, nonatomic) NSString *articuloString;
@property (strong, nonatomic) IBOutlet UITextView *articuloTextView;

- (IBAction)cerrar:(id)sender;

@end

@implementation ELBDetalleArticuloViewController


@synthesize articuloString=_articuloString;
@synthesize articuloTextView=_articuloTextView;

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
-(void)setArticulo:(NSString *)texto
{
    _articuloString=texto;

}
@end
