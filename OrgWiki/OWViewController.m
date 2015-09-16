//
//  ViewController.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "OWViewController.h"

@interface OWViewController ()

@end

@implementation OWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _userImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_userDetails[@"userProfileImage"]]]]];
    _userName.text = [NSString stringWithFormat:@"%@",_userDetails[@"UserName"]];
    
    self.listArray = [[NSMutableArray alloc]init];
    self.allDataArray = [[NSMutableArray alloc]init];
    self.searchArray = [[NSArray alloc]init];
    _listData = [[ListFunction alloc]init];
    
    logoutclass = [[loginclass alloc]init];
    
    _OWAppdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _manageobjectcontext = [_OWAppdelegate managedObjectContext];
    _fetchrequst = [[NSFetchRequest alloc]init];
    [_fetchrequst setEntity:[NSEntityDescription entityForName:@"List" inManagedObjectContext:_manageobjectcontext]];
    NSError *error;
    NSMutableArray *employeesMatchingNames = [[_manageobjectcontext executeFetchRequest:_fetchrequst error:&error] mutableCopy];
    
    self.listArray = employeesMatchingNames;
    self.allDataArray = employeesMatchingNames;
    
    if (self.listArray.count == 0)
    {
        [_listData withblock:^(BOOL result) {
            
            if (result)
            {
                [self coreDtate_resultFetch];
            }
            
        }];

    }
    else
    {
        _listTable.delegate = self;
        _listTable.dataSource = self;
        
        [_listTable reloadData];
    }
    
    _search_Text=[[NSString alloc]init];

}
-(void)initwithValue:(NSDictionary *)detailsValue
{
    _userDetails = detailsValue;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
}
-(void)coreDtate_resultFetch
{
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            
            NSError *error;
            NSMutableArray *employeesMatchingNames = [[_manageobjectcontext executeFetchRequest:_fetchrequst error:&error] mutableCopy];
            
            self.listArray = employeesMatchingNames;
            
            
            _searchArray=[_listArray mutableCopy];

            // Write your code here...
            // Fetch data from SQLite DB
        }
        dispatch_semaphore_signal(semaphore);
    });
    
    // Wait for a block execution
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    // Use fetched data here to reload table.
    dispatch_semaphore_signal(semaphore);
    _listTable.delegate = self;
    _listTable.dataSource = self;
    
    [_listTable reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    listTableViewCell *cell = (listTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"listTableViewCell" forIndexPath:indexPath];
    OWlist *listCoreData = [_listArray objectAtIndex:indexPath.row];
    
    [cell listArray:listCoreData];
    
    return cell;
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar becomeFirstResponder];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if (searchText.length==0)
    {
        [searchBar resignFirstResponder];
        
        [self searchBarCancelButtonClicked:searchBar];
    }
    else
    {
        _search_Text=searchText;
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(searchData) object:nil];
        [self performSelector:@selector(searchData) withObject:nil afterDelay:0.5];
    }

   

}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text=@"";
    
    [searchBar resignFirstResponder];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
                   {
                       _listArray=[_allDataArray mutableCopy];
                       
                       dispatch_async(dispatch_get_main_queue(), ^(void)
                                      {
                                          [_listTable reloadData];
                                          
                                      });
                   });
    
    
    
    
}

-(void)searchData
{
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    [myQueue addOperationWithBlock:^{
    
       
      
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", _search_Text];
        [_fetchrequst setPredicate:predicate];
        
        NSError *error;
        
       
        _searchArray = [_manageobjectcontext executeFetchRequest:_fetchrequst error:&error];
        
        _listArray=[_searchArray copy];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [_listTable reloadData];
            
            
        }];
    }];

    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *button;
    UITableViewRowAction *button2;
    
    button = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"SMS" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
    {
        
        UIAlertView *removeaskAlert =[[UIAlertView alloc ] initWithTitle:nil
                                                                 message:@"Do you want to send SMS"
                                                                delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                       otherButtonTitles: @"Ok", nil];
        
        [removeaskAlert show];
        
        
    }];
    
    //DELETE
    
    button2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"CALL" handler:^(UITableViewRowAction *action2, NSIndexPath *indexPath2)
    {
        
        
        UIAlertView *removeaskAlert2 =[[UIAlertView alloc ] initWithTitle:nil
                                                                  message:@"Do you want CALL"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles: @"Ok", nil];
        
        [removeaskAlert2 show];
        
        
    }];
    
    button.backgroundColor = [UIColor colorWithRed:(66/299.0f) green:(219/299.0f) blue:(15/299.0f) alpha:1];
    button2.backgroundColor = [UIColor redColor];
    
    return @[button,button2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
    
    
    [logoutclass withBlock:^(BOOL logout) {
        
        if (logout== YES)
        {
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle: nil];
            OWViewController *controller = (OWViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"LoginViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }];
    

}
@end
