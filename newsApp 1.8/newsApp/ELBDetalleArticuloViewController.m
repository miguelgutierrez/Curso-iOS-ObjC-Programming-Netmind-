//
//  ELBDetalleArticuloViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBDetalleArticuloViewController.h"
#import "ELBArticulo.h"
#import "Social/Social.h"

enum{
    kButtonSheetMail=0,
    kButtonSheetTwitter
};

@interface ELBDetalleArticuloViewController ()

- (void) grabaUserDefaults;
- (void) enviarMail;
- (void) compartirTwitter;
- (void) muestraArticulo:(ELBArticulo*)articulo;


@end

@implementation ELBDetalleArticuloViewController

@synthesize articuloTextView=_articuloTextView;
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
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_articulo)
        [self muestraArticulo:_articulo];
}
#pragma mark - eventos
- (IBAction)cerrar:(id)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)compartir:(id)sender
{
    UIActionSheet *styleAlert= [[UIActionSheet alloc] initWithTitle:@"Compártelo"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:
                                @"Mail",
                                @"Twitter",
                                nil];
    
    [styleAlert showFromTabBar:self.tabBarController.tabBar];

}
#pragma mark - funciones auxiliares

-(void)setArticulo:(ELBArticulo *)pArticulo
{
    _articulo =pArticulo;
    
    [self muestraArticulo:_articulo];
    
}
-(void) muestraArticulo:(ELBArticulo *)articulo
{
    NSDateFormatter *fechaFormatter = [[NSDateFormatter alloc] init];
	[fechaFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];

    NSString *texto= [NSString stringWithFormat:@"Escritor: %@  Fecha: %@ \n Artículo: %@",
                      articulo.nombre,
                      [fechaFormatter stringFromDate:articulo.fecha],
                      articulo.texto];

    _articuloTextView.text=texto;
}


-(void)grabaUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:1 forKey:@"lecturasDeArticulos"];
    [userDefaults synchronize];
}

#pragma mark MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case kButtonSheetMail:
            [self enviarMail];
            break;
        case kButtonSheetTwitter:
            [self compartirTwitter];
            break;
            
        default:
            break;
    }

}
#pragma mark - funciones auxiliares
-(void)enviarMail
{
    MFMailComposeViewController *mailComposer   =[[MFMailComposeViewController alloc] init];
    if (mailComposer) {
        
        mailComposer.mailComposeDelegate=self;
        
        NSString*asunto=[NSString stringWithFormat:@"Artículo de %@", _articulo.nombre];
        NSString *texto= [NSString stringWithFormat:@"Escritor: %@  Fecha: %@ \n Artículo: %@",
                          _articulo.nombre,
                          _articulo.fecha,
                          _articulo.texto];
        
        NSArray *arrayDeEmails = [NSArray arrayWithObject:@"miguel.gutierrez.moreno@gmail.com"];
        
        [mailComposer setToRecipients:arrayDeEmails];
        [mailComposer setSubject:asunto];
        [mailComposer setMessageBody:texto isHTML:YES];
        
        mailComposer.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mailComposer animated:YES completion:^{
            
        }];
    }
}
-(void)compartirTwitter
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        NSString *texto= [NSString stringWithFormat:@"Lee el artículo de: %@",
                          _articulo.nombre];

        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:texto];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

@end
