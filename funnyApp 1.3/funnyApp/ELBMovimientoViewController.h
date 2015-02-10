//
//  ELBMovimientoViewController.h
//  funnyApp
//
//  Created by Miguel Gutiérrez Moreno on 14/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELBMovimientoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *movimientoLabel;
@property (strong, nonatomic) IBOutlet UILabel *gestosLabel;

- (IBAction)swipe:(id)sender;
- (IBAction)tap:(id)sender;
- (IBAction)rotation:(id)sender;
- (IBAction)pinch:(id)sender;
- (IBAction)pan:(id)sender;
- (IBAction)longPress:(id)sender;
@end
