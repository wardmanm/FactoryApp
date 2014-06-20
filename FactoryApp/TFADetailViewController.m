//
//  TFADetailViewController.m
//  FactoryApp
//
//  Created by iOyster on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import "TFADetailViewController.h"
#import "TFAMember.h"

@interface TFADetailViewController ()

@end

@implementation TFADetailViewController

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
    self.nameLabel.text = self.person.name;
    self.picture.image = self.person.pic;
    self.bioLabel.text = self.person.bio;
    self.amaTextView.text = self.person.ama;
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
-(void)setPerson:(TFAMember *)person {
    _person = person;
    
}
- (IBAction)mailButton:(UIButton *)sender {
    // Email Subject
    NSString *emailTitle = @"Hello from the Factory!";
    // Email Content
    NSString *messageBody = [NSString stringWithFormat: @"Hello %@!  I was viewing your profile on the iOS actory App and had a few questions...", self.person.name] ;
    // Dynamic address based on Parse info
    NSArray *toRecipents = [NSArray arrayWithObject:self.person.email];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // Logs user selections and errors on the mail app
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)twitButton:(UIButton *)sender {
    // Dynamic twitter URL based on Parse info
    NSString *twitUrl = [NSString stringWithFormat: @"https://twitter.com/%@" , self.person.twitter];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: twitUrl]];
}

- (IBAction)fbButton:(UIButton *)sender {
    // Dynamic Facebook profile URL based on Parse info
    NSString *fbUrl = [NSString stringWithFormat: @"http://m.facebook.com/profile.php?id=%@" , self.person.fb];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: fbUrl]];
}
@end
