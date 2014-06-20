//
//  TFADetailViewController.m
//  FactoryApp
//
//  Created by Tim Holt on 6/3/14.
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
    
}

- (IBAction)twitButton:(UIButton *)sender {
    NSString *twitUrl = [NSString stringWithFormat: @"https://twitter.com/%@" , self.person.twitter];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: twitUrl]];
}

- (IBAction)fbButton:(UIButton *)sender {
    NSString *fbUrl = [NSString stringWithFormat: @"http://m.facebook.com/profile.php?id=%@" , self.person.fb];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: fbUrl]];
}
@end
