//
//  TFAViewController.m
//  FactoryApp
//
//  Created by Tim Holt on 6/2/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import "TFAViewController.h"

@interface TFAViewController ()

@end

@implementation TFAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    allItems = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", nil];
    displayItems = [[NSMutableArray alloc] initWithArray:allItems];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
}

//when the keyboard is shown, resizes the table view so it does not cut anything off.
-(void) keyboardShown:(NSNotification *)note {
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame = tableView.frame;
    tableViewFrame.size.height -= keyboardFrame.size.height;
    [tableView setFrame:tableViewFrame];
}

//When keyboard is hidden this changes the size back to normal of the table view
-(void) keyboardHidden:(NSNotification *)note {
    [tableView setFrame:self.view.bounds];
}


//returns the number of sections in the table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//returns the number of rows in the tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [displayItems count];
}

//returns the text of item stored in row
- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [aTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [displayItems objectAtIndex: indexPath.row];
    return cell;
}

//when something is typed in the search bar it returns the results using fuzzy searching
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [displayItems removeAllObjects];
        [displayItems addObjectsFromArray:allItems];
    } else {
        [displayItems removeAllObjects];
        for(NSString * string in allItems) {
            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound){
                [displayItems addObject:string];
            }
        }
    }
    [tableView reloadData];
}

//when search is clicked this hides the keyboard
-(void) searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
