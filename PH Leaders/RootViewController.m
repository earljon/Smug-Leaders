//
//  RootViewController.m
//  PH Leaders
//
//  Created by Earljon Hidalgo on 3/21/11.
//  Copyright 2011 Smugappventures Inc. All rights reserved.
//

#import "RootViewController.h"
#import "EGODatabase.h"
#import "President.h"
#import "WikiViewController.h"

@implementation RootViewController
@synthesize leaders;

#pragma mark - Private Methods
-(void) loadDatabaseData {
    database = [EGODatabase databaseWithPath:[NSHomeDirectory() 
                                              stringByAppendingPathComponent:@"Documents/ph_leaders.db"]];
    EGODatabaseResult* result = [database executeQuery:@"SELECT * FROM presidents"];
    
    if ([result count] > 0) {
        NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:[result count]];
        
        for(EGODatabaseRow* row in result) {
            President *pres = [[President alloc] init];
            pres.name = [row stringForColumn:@"name"];
            pres.from = [row stringForColumn:@"from"];
            pres.to = [row stringForColumn:@"to"];
            pres.imageFile = [row stringForColumn:@"image_file"];
            pres.wikiUrl = [row stringForColumn:@"wiki_url"];
            pres.leaderId = [row intForColumn:@"id"];
            [data addObject:pres];
            [pres release];
        }
        
        leaders = [[NSArray alloc] initWithArray:data];
        [data release];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Presidents";
    
    [self loadDatabaseData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [leaders count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    President *item = [leaders objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d. %@", item.leaderId, item.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", item.from, item.to];
    cell.imageView.image = [UIImage imageNamed:item.imageFile];
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
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
    President *item = [leaders objectAtIndex:indexPath.row];
    WikiViewController *vc = [[WikiViewController alloc] initWithNibName:@"WikiViewController" bundle:nil];
    vc.url = item.wikiUrl;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
    self.leaders = nil;
}

- (void)dealloc
{
    [leaders release];
    [super dealloc];
}

@end
