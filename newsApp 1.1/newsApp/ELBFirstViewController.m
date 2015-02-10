//
//  ELBFirstViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 06/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBFirstViewController.h"

enum {
    kElPais=0,
    kElMundo,
    kABC
};

@interface ELBFirstViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *periodicoSegmented;
@property (strong, nonatomic) IBOutlet UISwitch *ajustaWebSwitch;

@property (strong, nonatomic) IBOutlet UIWebView *periodicoWebView;

- (IBAction)setPeriodico:(id)sender;
- (IBAction)setAjustaWeb:(id)sender;

- (void) mostrarWeb:(NSInteger)periodico;

@end

@implementation ELBFirstViewController
@synthesize periodicoSegmented=_periodicoSegmented;
@synthesize periodicoWebView=_periodicoWebView;
@synthesize ajustaWebSwitch=_ajustaWebSwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _periodicoWebView.scalesPageToFit = _ajustaWebSwitch.on;  // para ajustar la visualización de la web al view
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self mostrarWeb:[ _periodicoSegmented selectedSegmentIndex]];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPeriodico:(id)sender
{
    UISegmentedControl *segmented= (UISegmentedControl*) sender;
    
    NSLog(@"Tipo periodico %li %@",
          (long)((UISegmentedControl*)sender).selectedSegmentIndex,
         [((UISegmentedControl*)sender) titleForSegmentAtIndex:((UISegmentedControl*)sender).selectedSegmentIndex]);

    [segmented selectedSegmentIndex];
    
    [self mostrarWeb:[ _periodicoSegmented  selectedSegmentIndex]];
}

- (IBAction)setAjustaWeb:(id)sender {
    _periodicoWebView.scalesPageToFit = _ajustaWebSwitch.on;
    [self mostrarWeb:[ _periodicoSegmented  selectedSegmentIndex]];

}
#pragma mark - funciones auxiliares
-(void)mostrarWeb:(NSInteger)periodico
{
    NSString *url=@"";
    switch (periodico) {
        case kElPais:
            url=@"http://www.elpais.es";
            break;
        case kElMundo:
            url=@"http://www.elmundo.es";
            break;
            
        case kABC:
            url=@"http://www.abc.es";
            break;
        default:
            break;
    }
    
    NSURL *urlNSURL =[[NSURL alloc] initWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlNSURL];
    
    [_periodicoWebView loadRequest:request];
     
    //[_periodicoWebView loadRequest:[NSURLRequest requestWithURL: [[NSURL alloc] initWithString:url]]];
}
@end
