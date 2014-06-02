//
//  TFAViewController.h
//  FactoryApp
//
//  Created by Tim Holt on 6/2/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFAViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate> {
    IBOutlet UITableView * tableView;
    IBOutlet UISearchBar * searchBar;
    
    NSArray * allItems;
    NSMutableArray * displayItems;
}

@end
