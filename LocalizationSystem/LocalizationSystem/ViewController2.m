//
//  ViewController2.m
//  LocalizationSystem
//
//  Created by Yuchi Chen on 2017/2/8.
//  Copyright © 2017年 Yuchi Chen. All rights reserved.
//

#import "ViewController2.h"
#import "LocalizationSystem.h"

@interface ViewController2 ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation ViewController2

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = YCLocalizedString(@"morning");
    [self.backButton setTitle:YCLocalizedStringFromTable(@"Z6z-qv-swg.normalTitle", @"Main") forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
