//
//  ELBArticuloViewController.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ELBArticulo;

@interface ELBArticuloViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nombreEscritorTextField;
@property (strong, nonatomic) IBOutlet UITextField *fechaArticuloTextField;
@property (strong, nonatomic) IBOutlet UITextView *textoArticuloTextView;


- (IBAction)ocultarTeclado:(id)sender;

- (void) setFecha: (NSDate *) fecha;
- (void) setArticulo : (ELBArticulo *)articulo;

- (IBAction)send:(id)sender;
@end
