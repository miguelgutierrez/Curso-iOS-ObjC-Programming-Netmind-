//
//  ELBNoticiasViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBNoticiasViewController.h"

static NSString *const kNombrePeriodicioIdentifier =@"nombre";
static NSString *const kURLPeriodicioIdentifier =@"url";

enum{
    kTipoPeriodico,
    kPeriodicos,
    kContadorComponent
};
enum{
    kPeriodicosGeneralistas,
    kPeriodicosDeportivos
};

/*
enum{
    kGeneralistasComponent=0,
    kDeportivosComponent,
    kContadorComponent
};
*/
@interface ELBNoticiasViewController ()

- (void) mostrarWeb:(NSString *)url;

// ejercicio: pasarlo a NSDictionary
@property (nonatomic,strong) NSArray *tiposPeriodicos;
@property (nonatomic,strong) NSArray *periodicosGeneralistas;
@property (nonatomic,strong) NSArray *periodicosDeportivos;
@property (nonatomic,strong) NSArray *urlPeriodicosGeneralistas;
@property (nonatomic,strong) NSArray *urlPeriodicosDeportivos;

@property (nonatomic, strong) NSArray *periodicosGeneralistasDictionary;
@property (nonatomic, strong) NSArray *periodicosDeportivosDictionary;

@end

@implementation ELBNoticiasViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _periodicoWebView.scalesPageToFit = YES;
    
    // inicialia los arrays de periódicos
    _tiposPeriodicos = [[NSArray alloc] initWithObjects:
                               @"Generalistas",
                               @"Deportivos",
                               nil];

    _periodicosGeneralistas = [[NSArray alloc] initWithObjects:
                               @"El País",
                               @"El Mundo",
                               @"ABC",
                               @"La Vanguardia",
                               @"El Correo",
                               nil];
    
    _urlPeriodicosGeneralistas = [[NSArray alloc] initWithObjects:
                                  @"http://www.elpais.es",
                                  @"http://www.elmundo.es",
                                  @"http://www.ABC.es",
                                  @"http://www.lavanguardia.com",
                                  @"http://www.elcorreo.com",
                                  nil];
    
    _periodicosDeportivos = [[NSArray alloc] initWithObjects:
                               @"Marca",
                               @"AS",
                               @"Mundo Deportivo",
                               nil];
    
    _urlPeriodicosDeportivos = [[NSArray alloc] initWithObjects:
                                  @"http://www.marca.com",
                                  @"http://www.as.com",
                                  @"http://www.mundodeportivo.com",
                                  nil];
    
    
    // periódicos deportivos
    NSDictionary *dictionaryMarca = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Marca",kNombrePeriodicioIdentifier,
                                     @"http://www.marca.com",kURLPeriodicioIdentifier,nil];
    NSDictionary *dictionaryAS = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"AS",kNombrePeriodicioIdentifier,
                                  @"http://www.as.com",kURLPeriodicioIdentifier,nil];
    NSDictionary *dictionaryMundoDeportivo = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"Mundo Deportivo",kNombrePeriodicioIdentifier,
                                  @"http://www.mundodeportivo.com",kURLPeriodicioIdentifier,nil];
    _periodicosDeportivosDictionary = [[NSArray alloc] initWithObjects:dictionaryMarca,dictionaryAS,dictionaryMundoDeportivo, nil];
    

    NSDictionary *dictionaryPais = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"El País",kNombrePeriodicioIdentifier,
                                    @"http://www.elapais.com",kURLPeriodicioIdentifier,nil];
    NSDictionary *dictionaryElMundo = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"EL Mundo",kNombrePeriodicioIdentifier,
                                    @"http://www.elmundo.es",kURLPeriodicioIdentifier,nil];
    NSDictionary *dictionaryABC = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"ABC",kNombrePeriodicioIdentifier,
                                       @"http://www.abc.es",kURLPeriodicioIdentifier,nil];

    NSDictionary *dictionaryVanguardia = [NSDictionary dictionaryWithObjectsAndKeys:
                                           @"Vanguardia",kNombrePeriodicioIdentifier,
                                          @"http://www.lavanguardia.com",kURLPeriodicioIdentifier,nil];
    
    NSDictionary *dictionaryCorreo = [NSDictionary dictionaryWithObjectsAndKeys:
                                           @"El Correo",kNombrePeriodicioIdentifier,
                                          @"http://www.correo.com",kURLPeriodicioIdentifier,nil];
    
    _periodicosGeneralistasDictionary = [NSArray arrayWithObjects:
                                         dictionaryPais,dictionaryElMundo,dictionaryABC,dictionaryVanguardia,dictionaryCorreo, nil];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self mostrarWeb:[_urlPeriodicosGeneralistas objectAtIndex:0]] ;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kContadorComponent;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kTipoPeriodico) {
        return [_tiposPeriodicos count];
    }
    else{
        // dependiendo del tipo de periódico será la cantidad
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas) 
            return [_periodicosGeneralistas count];
        else
            return [_periodicosDeportivos count];
    }
}
#pragma mark - UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    if (component == kTipoPeriodico) {
        return [_tiposPeriodicos objectAtIndex:row];
    }
    else{
        // dependiendo del tipo de periódico será la cantidad
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas){
//            return [_periodicosGeneralistas objectAtIndex:row];
            NSDictionary *dictionaryPeriodico = [_periodicosGeneralistasDictionary objectAtIndex:row];
            return [dictionaryPeriodico valueForKey:kNombrePeriodicioIdentifier];
        }
        else{
//            return [_periodicosDeportivos objectAtIndex:row];
            NSDictionary *dictionaryPeriodico = [_periodicosDeportivosDictionary objectAtIndex:row];
            return [dictionaryPeriodico valueForKey:kNombrePeriodicioIdentifier];
        }
    }

}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDictionary *dictionaryPeriodico;
    if (component == kTipoPeriodico) {
        [_periodicoPickerView reloadComponent:kPeriodicos];
        [_periodicoPickerView selectRow:0 inComponent:kPeriodicos animated:YES];
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas){
            //[self mostrarWeb:[_urlPeriodicosGeneralistas objectAtIndex:0]];
            dictionaryPeriodico= [_periodicosGeneralistasDictionary objectAtIndex:0];
        }
        else
            dictionaryPeriodico= [_periodicosDeportivosDictionary objectAtIndex:0];
            //[self mostrarWeb:[_urlPeriodicosDeportivos objectAtIndex:0]];
    }
    else{
        // dependiendo del tipo de periódico será la cantidad
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas)
            //[self mostrarWeb:[_urlPeriodicosGeneralistas objectAtIndex:row]];
            dictionaryPeriodico= [_periodicosGeneralistasDictionary objectAtIndex:row];
        else
            dictionaryPeriodico= [_periodicosDeportivosDictionary objectAtIndex:row];
            //[self mostrarWeb:[_urlPeriodicosDeportivos objectAtIndex:row]];
    }
    [self mostrarWeb:[dictionaryPeriodico valueForKey:kURLPeriodicioIdentifier]];
    
}
#pragma mark - funciones auxiliares
-(void)mostrarWeb:(NSString *)url
{

    [_periodicoWebView loadRequest:[NSURLRequest requestWithURL: [[NSURL alloc] initWithString:url]]];
    
}

@end
