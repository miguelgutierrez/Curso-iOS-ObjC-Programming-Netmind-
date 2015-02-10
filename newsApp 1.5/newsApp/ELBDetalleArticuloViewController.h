//
//  ELBDetalleArticuloViewController.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ELBArticulo;

@interface ELBDetalleArticuloViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *articuloTextView;

- (IBAction)cerrar:(id)sender;

- (void) setTextoArticulo:(NSString*)texto;
- (void) setArticulo:(ELBArticulo *)articulo;

@end
