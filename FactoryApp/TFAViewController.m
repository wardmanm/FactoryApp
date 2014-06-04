//
//  TFAViewController.m
//  FactoryApp
//
//  Created by Tim Holt on 6/2/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import "TFAViewController.h"

@interface TFAViewController (){
    NSArray *people;
    NSMutableArray *peopleSearch;
}

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

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSDictionary *trenton = @{@"ama": @"",
                                  @"bio": @"",
                                  @"email": @"",
                                  @"fb": @"",
                                  @"name": @"Trenton Broughton",
                                  @"twitter": @"",
                                  @"pic": @""};
        NSDictionary *garrick = @{@"ama": @"",
                                  @"bio": @"",
                                  @"email": @"",
                                  @"fb": @"",
                                  @"name": @"Garrick Pohl",
                                  @"twitter": @"",
                                  @"pic": @""};
        NSDictionary *ron = @{@"ama": @"",
                              @"bio": @"",
                              @"email": @"",
                              @"fb": @"",
                              @"name": @"Ron VanSurksum",
                              @"twitter": @"",
                              @"pic": @""};
        people = @[trenton, garrick, ron];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    peopleSearch = [[NSMutableArray alloc] initWithArray:people];
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
    return [people count];
}

//returns the text of item stored in row
- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [aTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [people objectAtIndex: indexPath.row][@"name"];
    return cell;
}

//when something is typed in the search bar it returns the results using fuzzy searching
-(void) searchBar:(UISearchBar *)aSearchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [peopleSearch removeAllObjects];
        [peopleSearch addObjectsFromArray:people];
    } else {
        [peopleSearch removeAllObjects];
        for(NSString * string in people) {
            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(r.location != NSNotFound){
                [peopleSearch addObject:string];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMemberDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SBSMember *person = [datastore recordAtIndex:indexPath.row];
        SBSPersonDetailsViewController *vc = segue.destinationViewController;
        vc.person = person;
    }
}

@end
