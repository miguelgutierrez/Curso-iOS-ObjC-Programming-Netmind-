//
//  ELBCaptandoLaAtencionDelUsuarioVC.m
//  funnyApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBCaptandoLaAtencionDelUsuarioVC.h"
#import <AVFoundation/AVFoundation.h>

enum{
    AlertFaltaIntroducirNombre=0,
    AlertClave
};

@interface ELBCaptandoLaAtencionDelUsuarioVC ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *mensajeLabel;

- (IBAction)error:(id)sender;
- (IBAction)solicitaClave:(id)sender;

- (IBAction)compartelo:(id)sender;

- (IBAction)sonido:(id)sender;
- (IBAction)vibracion:(id)sender;

@property (strong, nonatomic)  AVAudioPlayer*audioPlayer;


@end

@implementation ELBCaptandoLaAtencionDelUsuarioVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 800);

    //Setup the audio player
    NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                           [[NSBundle mainBundle]
                            pathForResource:@"splash" ofType:@"wav"]];
    _audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:noSoundFileURL error:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions
- (IBAction)error:(id)sender
{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"ERROR"
                   message:@"Falta por introducir el nombre. Quieres continuar?"
                   delegate: self
                   cancelButtonTitle: @"Si"
                   otherButtonTitles: @"No",nil];
    alertDialog.tag=AlertFaltaIntroducirNombre;
	[alertDialog show];
}

- (IBAction)solicitaClave:(id)sender
{
    UIAlertView *alertDialog;
	alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Clave"
                   message:@"Por favor, introduce la clave"
                   delegate: self
                   cancelButtonTitle: @"OK"
                   otherButtonTitles: @"Cancel",nil];
    alertDialog.tag=AlertClave;
    alertDialog.alertViewStyle = UIAlertViewStyleSecureTextInput;
    
	[alertDialog show];
}

- (IBAction)compartelo:(id)sender
{
    UIActionSheet *styleAlert= [[UIActionSheet alloc] initWithTitle:@"Compártelo"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:
                                                    @"Mail",
                                                    @"Twitter",
                                                    @"Facebook",
                                                    nil];
    
    [styleAlert showFromTabBar:self.tabBarController.tabBar];

}

- (IBAction)sonido:(id)sender
{
    
    [_audioPlayer play];
}

- (IBAction)vibracion:(id)sender
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark - delegates
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *nombreButton= [alertView buttonTitleAtIndex:buttonIndex];
    switch (alertView.tag) {
        case AlertFaltaIntroducirNombre:
                if ([nombreButton isEqualToString:@"Si"]) {
                    _mensajeLabel.text= @"Quiere continuar";
                }
                else
                    _mensajeLabel.text= @"NO quiere continuar";
            break;
        case AlertClave:
            if ([nombreButton isEqualToString:@"OK"])
                _mensajeLabel.text= [[alertView textFieldAtIndex:0] text];
            else
                _mensajeLabel.text=@"No ha introducido la clave";
            
            break;
        default:
            break;
    }
    /*
    if ([alertView.title isEqualToString:@"ERROR"]) {
        if ([nombreButton isEqualToString:@"Si"]) {
            _mensajeLabel.text= @"Quiere continuar";
        }
        else
            _mensajeLabel.text= @"NO quiere continuar";
    }
    else
        if ([alertView.title isEqualToString:@"Clave"]) {
            if ([nombreButton isEqualToString:@"OK"]) {
                _mensajeLabel.text= [[alertView textFieldAtIndex:0] text];
            }
            else
                _mensajeLabel.text=@"No ha introducido la clave";
        }
     */
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex==3)
        _mensajeLabel.text=@"No quiere compartirlo con nadie";
    else{
        NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
        _mensajeLabel.text=[NSString stringWithFormat:@"Compartido por %@", buttonTitle];
    }
}
@end
