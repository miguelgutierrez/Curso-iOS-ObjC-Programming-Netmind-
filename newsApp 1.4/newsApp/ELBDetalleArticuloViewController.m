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
@property (strong, nonatomic) IBOutlet UIWebView *textoArticuloWebView;

- (IBAction)cerrar:(id)sender;

@end

@implementation ELBDetalleArticuloViewController


@synthesize articuloString=_articuloString;
@synthesize textoArticuloWebView=_textoArticuloWebView;

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
    //  <p style=\"text-align: justify;\"><b>%@</b></p>
    NSString *textoHTML=
    [NSString stringWithFormat:@"EL ARTÍCULO  ES:<p style=\"text-align: left;\"><b>%@</b></p>", _articuloString];
    [_textoArticuloWebView loadHTMLString:textoHTML baseURL:nil];
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
