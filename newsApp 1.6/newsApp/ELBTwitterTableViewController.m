//
//  ELBTwitterTableViewController.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 18/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBTwitterTableViewController.h"
#import "ELBPost.h"

#define MAX_POST_EN_LA_TABLA   30

@interface ELBTwitterTableViewController ()
@property (nonatomic,strong) NSMutableArray *arrayDeTweets;

- (void) leerTweets;
- (void) actualizaArrayPosts:(NSArray *)array_posts;

@end

@implementation ELBTwitterTableViewController

@synthesize arrayDeTweets=_arrayDeTweets;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _arrayDeTweets = [NSMutableArray arrayWithCapacity:MAX_POSTS];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self leerTweets];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_arrayDeTweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Tweet";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ELBPost *post = [_arrayDeTweets objectAtIndex:indexPath.row];
    
    NSDateFormatter *fechaFormatter = [[NSDateFormatter alloc] init];
	[fechaFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
    cell.textLabel.text= [fechaFormatter stringFromDate:post.creado];
    cell.detailTextLabel.text=post.texto;
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
-(void)leerTweets
{

    [ELBPost ultimosPost:^(NSArray *posts, NSError *error) {
        if(!error){
            [self actualizaArrayPosts:posts];
            [self.tableView reloadData];
        }
        else{
        }
    } total:MAX_POSTS];
    
}
-(void) actualizaArrayPosts:(NSArray *)array_posts
{
    [_arrayDeTweets removeAllObjects];
    [_arrayDeTweets addObjectsFromArray:array_posts];
}
@end
