//
//  ELBSecondViewController.m
//  funnyApp
//
//  Created by Miguel Gutiérrez Moreno on 08/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBSecondViewController.h"

@interface ELBSecondViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ELBSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//  ok  _scrollView.contentSize = CGSizeMake(280, 800);
// ok    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 800);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
