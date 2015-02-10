//
//  ELBArticuloViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBArticuloViewController.h"
#import "ELBDetalleArticuloViewController.h"
#import "ELBFechaViewController.h"
#import "ELBArticulo.h"
#import "ELBStore.h"

@interface ELBArticuloViewController ()

@property (nonatomic,strong) ELBArticulo *articulo;

@end

@implementation ELBArticuloViewController
@synthesize nombreEscritorTextField=_nombreEscritorTextField;
@synthesize fechaArticuloTextField=_fechaArticuloTextField;
@synthesize textoArticuloTextView=_textoArticuloTextView;
@synthesize articulo=_articulo;

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
        _articulo.nombre=_nombreEscritorTextField.text;
        _articulo.texto=_textoArticuloTextView.text;
        [controlador setArticulo:_articulo];
        /*
         NSString *texto= [NSString stringWithFormat:@"Escritor: %@  Fecha: %@ \n Artículo: %@",
         _nombreEscritorTextField.text,
         _fechaArticuloTextField.text,
         _textoArticuloTextView.text];
         
         [controlador setTextoArticulo:texto];*/
    }
    else
        if ([[segue identifier] isEqualToString:@"aFecha"]) {
            
            ELBFechaViewController *controlador = segue.destinationViewController;
            
            [controlador setDelegate:self];
            
        }
}
#pragma mark - eventos
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];

}

- (IBAction)ocultarTeclado:(id)sender
{
    [sender resignFirstResponder];
    
}
#pragma mark - otros métodos
-(void)setFecha:(NSDate *)fecha
{
    NSDateFormatter *fechaFormatter = [[NSDateFormatter alloc] init];
	[fechaFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
	_fechaArticuloTextField.text = [fechaFormatter stringFromDate:fecha];
    _articulo.fecha = fecha;

}
- (IBAction)send:(id)sender
{
    _articulo.texto = _textoArticuloTextView.text;
    _articulo.nombre= _nombreEscritorTextField.text;
   // [self dismissViewControllerAnimated:YES completion:^{ }];
    [self.navigationController popViewControllerAnimated:YES];

    NSManagedObjectContext *context = [[ELBStore defaultStore] context];
    NSError *savingError = nil;
    if (![context save:&savingError])
        NSLog(kErrorSaveObjectFormat,[ELBArticulo entityName]);


}
@end
