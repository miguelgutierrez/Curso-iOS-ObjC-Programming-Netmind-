//
//  ELBNoticiasViewController.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 09/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELBNoticiasViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (strong, nonatomic) IBOutlet UIPickerView *periodicoPickerView;
@property (strong, nonatomic) IBOutlet UIWebView *periodicoWebView;

@end
