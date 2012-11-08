//
//  MentionSelectorViewController.m
//  ChatterCheckin
//
//  Created by John Gifford on 10/9/12.
//  Copyright (c) 2012 Model Metrics. All rights reserved.
//

#import "SelectUserViewController.h"
#import "User.h"
#import "LoadingViewController.h"

@interface SelectUserViewController ()

@end

@implementation SelectUserViewController

@synthesize selectedUsers = _selectedUsers;

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
    
    if (_selectedUsers == nil) {
        _selectedUsers = [[NSMutableArray alloc]initWithCapacity:0];
    }

    [self setTitle:@"Following"];
    [self getUsers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getUsers
{
	SFRestRequest* request = [[SFRestAPI sharedInstance] requestForResources];
    
    NSString *pathString = _nextPageURL != nil ? _nextPageURL : [NSString stringWithFormat:@"%@/chatter/users/me/following?pageSize=20&filterType=005", request.path];
    
    request.path = pathString;
    
    NSLog(@"Path: %@",request.path);
    
    [[SFRestAPI sharedInstance] send:request delegate:self];
}


#pragma mark - SFRestAPIDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse {
    
    //TODO: STEP 1 - Load _dataRows with User objects from jsonResponse
    
    //TODO: STEP 1 - Handle paging properly to retrieve more records
    
    //TODO: STEP 3 - Sort _dataRows by fullName alphabetically
}


- (void)request:(SFRestRequest*)request didFailLoadWithError:(NSError*)error {
    NSLog(@"request:didFailLoadWithError: %@", error);
    //add your failed error handling here
}

- (void)requestDidCancelLoad:(SFRestRequest *)request {
    NSLog(@"requestDidCancelLoad: %@", request);
    //add your failed error handling here
}

- (void)requestDidTimeout:(SFRestRequest *)request {
    NSLog(@"requestDidTimeout: %@", request);
    //add your failed error handling here
}

- (NSDictionary *)getUserForIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *following = [_dataRows objectAtIndex:indexPath.row];
    NSLog(@"following: %@",following);
    
    NSDictionary *user = [following objectForKey:@"subject"];
    NSLog(@"user: %@",user);
    
    return user;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return _filteredUsers == nil ? 0 : [_filteredUsers count];
    } else {
        return _dataRows == nil ? 0 : [_dataRows count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    

    
    User *user = nil;
    
    //TODO: STEP 1 - Configure cell to display username from User objects in _dataRows
    
    //TODO: STEP 2 - Display checkmark next to selected user - setAccessoryType:
    
    //TODO: STEP 4 - Handle search results display using _filteredUsers
    
    
    cell.textLabel.text = user.fullName;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: STEP 2 - Load selected User into _selectedUsersArray
    
    //TODO: STEP 2 - Remove 'deselected' user from _selectedUsersArray
    
    //TODO: STEP 2 - Reload tableView
    
}

#pragma mark - UISearchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    UISearchBar *searchBar = self.searchDisplayController.searchBar;
    [self filterContentForSearchText:searchString scope:[[searchBar scopeButtonTitles] objectAtIndex:[searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
	//TODO:STEP 4 - Update _filteredUsers based on the search text and scope.
	
    // Remove all objects from the filtered search array
    
	// Filter the array using NSPredicate

}


@end
