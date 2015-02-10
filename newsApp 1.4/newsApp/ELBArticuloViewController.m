//
//  ELBArticuloViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//
//     * v 1.4: revisar Storyboard
#import "ELBArticuloViewController.h"
#import "ELBDetalleArticuloViewController.h"

@interface ELBArticuloViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nombreEscritorTextField;
@property (strong, nonatomic) IBOutlet UITextField *fechaArticuloTextField;
@property (strong, nonatomic) IBOutlet UITextView *textoArticuloTextView;

- (IBAction)ocultaTeclado:(id)sender;

@end

@implementation ELBArticuloViewController

@synthesize nombreEscritorTextField=_nombreEscritorTextField;
@synthesize fechaArticuloTextField=_fechaArticuloTextField;
@synthesize textoArticuloTextView=_textoArticuloTextView;


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"aDetalleArticulo"]) {

        ELBDetalleArticuloViewController *controlador = segue.destinationViewController;
        
        NSString *texto= [NSString stringWithFormat:@"Escritor: %@  Fecha: %@ \n Artículo: %@",
                          _nombreEscritorTextField.text,
                          _fechaArticuloTextField.text,
                          _textoArticuloTextView.text];
        [controlador setArticulo:texto];
        
    }
}
#pragma mark - eventos

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [super touchesBegan:touches withEvent:event];

    [self.view endEditing:YES];

}
- (IBAction)ocultaTeclado:(id)sender
{
    [sender resignFirstResponder];
}
@end
