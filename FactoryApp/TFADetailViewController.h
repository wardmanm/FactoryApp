//
//  TFADetailViewController.h
//  FactoryApp
//
//  Created by Tim Holt on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TFAMember;

@interface TFADetailViewController : UIViewController

@property (nonatomic) TFAMember *person;
@property IBOutlet UILabel *nameLabel;
@property IBOutlet UITextView *bioLabel;
@property IBOutlet UILabel *fbLabel;
@property IBOutlet UILabel *twitterLabel;
@property IBOutlet UILabel *emailLabel;
@property IBOutlet UIImageView *picture;

@end
