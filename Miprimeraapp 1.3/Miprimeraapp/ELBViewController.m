//
//  ELBViewController.m
//  Miprimeraapp
//
//  Created by Miguel Gutiérrez Moreno on 05/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//
//  No pasa al estado "suspended"
//  Al pulsar el botón ACTUAL:
//      - cambia la hora automáticamente cada sg.
//
#import "ELBViewController.h"

@interface ELBViewController ()

@property (strong, nonatomic) IBOutlet UILabel *saludoLabel;
@property (strong, nonatomic) IBOutlet UILabel *fechaYHoraLabel;

- (IBAction)muestraFechaYHora:(id)sender;

- (void) saluda:(NSString *)texto de:(NSString *)nombre esPorLaTarde:(Boolean)esPorLaTarde;
- (void) saluda:(NSString *)texto de:(NSString *)nombre;

@end

@implementation ELBViewController

@synthesize saludoLabel=_saludoLabel;
@synthesize fechaYHoraLabel=_fechaYHoraLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _saludoLabel.text=@"Hola a todos";
    
   // NSURL *urlCurso = [[NSURL alloc] initWithString:@"http://www.netmind.es"];
    
    // [self saluda:@"Hola a todos." de:@"Miguel" esPorLaTarde:YES];
    [self saluda:@"Hola a todos." de:@"Miguel"];
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];  // tener en cuenta el uso de la batería
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saluda:(NSString *)texto de:(NSString *)nombre esPorLaTarde:(Boolean)esPorLaTarde
{
    NSString *mannanaotarde;
    if (esPorLaTarde)
        mannanaotarde=@"Buenas tardes";
    else
        mannanaotarde=@"Buenos días";
    
    NSString *cadena =[NSString stringWithFormat:@"%@ %@ de parte de %@",
                       texto,mannanaotarde,nombre];
    
    _saludoLabel.text=cadena;
        
}
-(void)saluda:(NSString *)texto de:(NSString *)nombre
{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:[NSDate date]];
    NSInteger hour = [components hour];
    
    NSString *mannanaotarde;

    if(hour >= 0 && hour < 12)
        mannanaotarde=@"Buenos días";
    else if(hour >= 12 && hour < 19)
        mannanaotarde=@"Buenas tardes";
    else if(hour >= 19)
        mannanaotarde=@"Buenas noches";
    
    
    NSString *cadena =[NSString stringWithFormat:@"%@ %@ de parte de %@",
                       texto,mannanaotarde,nombre];
    
    _saludoLabel.text=cadena;
    
    
}
- (IBAction)muestraFechaYHora:(id)sender
{
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm:ss"];

    //_fechaYHoraLabel.text=[NSString stringWithFormat:@"%@", [DateFormatter stringFromDate:[NSDate date]]];
    _fechaYHoraLabel.text=[dateFormatter stringFromDate:[NSDate date]];
    
    [self performSelector:@selector(muestraFechaYHora:) withObject:self afterDelay:1.0];
    
}

@end
