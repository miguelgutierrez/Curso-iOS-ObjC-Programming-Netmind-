//
//  ELBArticulosTableViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 17/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//
//  Esto es un ejemplo como apoyo a la formación, por lo que su objetivo es sólo didáctico
//
#import "ELBArticulosTableViewController.h"
#import "ELBArticulo.h"
#import "ELBArticuloViewController.h"
#import "ELBDetalleArticuloViewController.h"
#import "ELBStore.h"

@interface ELBArticulosTableViewController ()

@property (nonatomic,strong) NSMutableArray *arrayDeArticulos;
@property (nonatomic,strong) ELBDetalleArticuloViewController *detalleViewController;
@property (nonatomic) NSInteger lecturasRealizadas;

- (void) actualizaArticulosDeCoreData;
- (void) muestraBadge;
- (NSInteger) leeCantidadDeLecturasDeUserDefaults;
- (void) grabaUserDefaults;
- (void) muestraCantidadDeLecturas;
@end

@implementation ELBArticulosTableViewController

@synthesize arrayDeArticulos=_arrayDeArticulos;
@synthesize detalleViewController=_detalleViewController;
@synthesize lecturasRealizadas=_lecturasRealizadas;
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _arrayDeArticulos = [NSMutableArray arrayWithCapacity:0];//capacidad inicial
    // para e iPad
    if (self.splitViewController)
        //_detalleViewController = (ELBDetalleArticuloViewController*)[[self.splitViewController.viewControllers lastObject] topViewController];
        _detalleViewController = (ELBDetalleArticuloViewController*)[self.splitViewController.viewControllers lastObject];

    _lecturasRealizadas = [self leeCantidadDeLecturasDeUserDefaults];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self actualizaArticulosDeCoreData];
    [self muestraBadge];
    [self muestraCantidadDeLecturas];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
 */
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayDeArticulos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Articulo";
  //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    ELBArticulo *articulo = [_arrayDeArticulos objectAtIndex:indexPath.row];
    cell.textLabel.text=articulo.nombre;
    cell.detailTextLabel.text=articulo.texto;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_arrayDeArticulos count]> indexPath.row)
        [_detalleViewController setArticulo:[_arrayDeArticulos objectAtIndex:indexPath.row]];
    
}
#pragma mark - Table view delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"aDetalleArticulo"]) {
        // evitar buscar de nuevo
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ELBArticulo *articulo = [_arrayDeArticulos objectAtIndex:indexPath.row];
        NSLog(@"Nombre de la clase de detalle: %@", [segue.destinationViewController class]);
        _lecturasRealizadas++;
        [self grabaUserDefaults];
        ELBDetalleArticuloViewController *controlador = (ELBDetalleArticuloViewController *)segue.destinationViewController;
        
        [controlador setArticulo:articulo];
    }
    else
        if ([[segue identifier] isEqualToString:@"addArticulo"]) {

            /*
            ELBArticulo *articulo = [[ELBArticulo alloc] init];
            [_arrayDeArticulos addObject:articulo];*/
            
            NSManagedObjectContext *context= [[ELBStore defaultStore]context];
            ELBArticulo *articulo =
                [NSEntityDescription insertNewObjectForEntityForName:[ELBArticulo entityName]
                                              inManagedObjectContext: context];
            
            if (articulo != nil){
                ELBArticuloViewController *controlador = (ELBArticuloViewController *)segue.destinationViewController;
                [controlador setArticulo:articulo];                
                
            } else {
                NSLog(kErrorCrearObjectFormat,[ELBArticulo entityName]);
            }

        }
    
}
-(void)muestraBadge
{
    if ([_arrayDeArticulos count]>0) {
        NSString *totalArticulosStr=[NSString stringWithFormat:@"%lu", (unsigned long)[_arrayDeArticulos count] ];
        self.navigationController.tabBarItem.badgeValue=totalArticulosStr;
    }
}
-(void)actualizaArticulosDeCoreData
{
    [_arrayDeArticulos removeAllObjects];
    [_arrayDeArticulos addObjectsFromArray:[ELBArticulo articulos]];
}
- (NSInteger)leeCantidadDeLecturasDeUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *lecturas= [userDefaults objectForKey:@"lecturasDeArticulos"];
    return [lecturas integerValue];
    
}
-(void)grabaUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:_lecturasRealizadas forKey:@"lecturasDeArticulos"];
    [userDefaults synchronize];
}
-(void)muestraCantidadDeLecturas
{
 
    NSString *lecturasStr= [NSString stringWithFormat:@"Has realizado %li lecturas",(long)_lecturasRealizadas];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Lecturas"
                                                        message:lecturasStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}
@end
