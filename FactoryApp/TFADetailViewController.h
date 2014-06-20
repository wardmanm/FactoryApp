//
//  TFADetailViewController.h
//  FactoryApp
//
//  Created by iOyster on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@class TFAMember;

@interface TFADetailViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)fbButton:(UIButton *)sender;
- (IBAction)twitButton:(UIButton *)sender;
- (IBAction)mailButton:(UIButton *)sender;

@property (nonatomic) TFAMember *person;
@property IBOutlet UILabel *nameLabel;
@property IBOutlet UITextView *bioLabel;
@property IBOutlet UIButton *fbButton;
@property IBOutlet UILabel *twitterLabel;
@property IBOutlet UILabel *emailLabel;
@property IBOutlet UIImageView *picture;
@property IBOutlet UITextView *amaTextView;

@end
