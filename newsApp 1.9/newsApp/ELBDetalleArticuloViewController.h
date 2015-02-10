//
//  ELBDetalleArticuloViewController.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@class ELBArticulo;

@interface ELBDetalleArticuloViewController : UIViewController <MFMailComposeViewControllerDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITextView *articuloTextView;
@property (nonatomic, strong) ELBArticulo *articulo;

- (IBAction)cerrar:(id)sender;
- (IBAction)compartir:(id)sender;

//- (void) setArticulo:(ELBArticulo *)articulo;

@end
