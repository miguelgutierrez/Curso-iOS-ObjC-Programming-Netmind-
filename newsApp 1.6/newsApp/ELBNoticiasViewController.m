//
//  ELBNoticiasViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBNoticiasViewController.h"

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

@end

@implementation ELBNoticiasViewController

@synthesize tiposPeriodicos=_tiposPeriodicos;
@synthesize periodicoWebView=_periodicoWebView;
@synthesize periodicoPickerView=_periodicoPickerView;
@synthesize periodicosGeneralistas=_periodicosGeneralistas;
@synthesize periodicosDeportivos=_periodicosDeportivos;

/* v 1.4
@synthesize tipoPeriodicoSwitch=_tipoPeriodicoSwitch;
@synthesize periodicoSegmented=_periodicoSegmented;
@synthesize ajustaWebSwitch=_ajustaWebSwitch;
*/
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
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas)
            return [_periodicosGeneralistas objectAtIndex:row];
        else
            return [_periodicosDeportivos objectAtIndex:row];
    }

}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kTipoPeriodico) {
        [_periodicoPickerView reloadComponent:kPeriodicos];
        [_periodicoPickerView selectRow:0 inComponent:kPeriodicos animated:YES];
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas)
            [self mostrarWeb:[_urlPeriodicosGeneralistas objectAtIndex:0]];
        else
            [self mostrarWeb:[_urlPeriodicosDeportivos objectAtIndex:0]];

    }
    else{
        // dependiendo del tipo de periódico será la cantidad
        if ([_periodicoPickerView selectedRowInComponent:kTipoPeriodico] == kPeriodicosGeneralistas)
            [self mostrarWeb:[_urlPeriodicosGeneralistas objectAtIndex:row]];
        else
            [self mostrarWeb:[_urlPeriodicosDeportivos objectAtIndex:row]];
    }
    
}
#pragma mark - funciones auxiliares
-(void)mostrarWeb:(NSString *)url
{

    [_periodicoWebView loadRequest:[NSURLRequest requestWithURL: [[NSURL alloc] initWithString:url]]];
    
}

@end
