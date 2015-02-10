//
//  ELBViewController.m
//  Miprimeraapp
//
//  Created by Miguel Gutiérrez Moreno on 05/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBViewController.h"

@interface ELBViewController ()

@property (weak, nonatomic) IBOutlet UILabel *saludoLabel;

- (void) saluda:(NSString *)texto de:(NSString *)nombre esPorLaTarde:(Boolean)esPorLaTarde;

@end

@implementation ELBViewController

@synthesize saludoLabel=_saludoLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // _saludoLabel.text=@"Hola a todos";
    
    [self saluda:@"Hola a todos." de:@"Miguel" esPorLaTarde:YES];
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

@end
