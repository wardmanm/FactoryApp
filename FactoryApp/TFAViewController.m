//
//  TFAViewController.m
//  FactoryApp
//
//  Created by iOyster on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import "TFAViewController.h"
#import "TFADetailViewController.h"
#import "TFAMember.h"
#import "TFAMemberDatastore.h"

@interface TFAViewController (){
//    NSArray *people;
//    NSMutableArray *peopleSearch;
    TFAMemberDatastore *data;
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
        data = [[TFAMemberDatastore alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//returns the number of sections in the table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//returns the number of rows in the tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

//returns the text of item stored in row
- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [aTableView dequeueReusableCellWithIdentifier:@"memberCell" forIndexPath:indexPath];
    TFAMember *member = [data recordAtIndex:indexPath.row];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
    cell.textLabel.text = member.name;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMemberDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TFAMember *person = [data recordAtIndex:indexPath.row];
        TFADetailViewController *vc = segue.destinationViewController;
        vc.person = person;
    }
}

@end
