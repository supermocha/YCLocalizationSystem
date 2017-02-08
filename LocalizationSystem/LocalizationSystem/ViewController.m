//
//  ViewController.m
//  LocalizationSystem
//
//  Created by Yuchi Chen on 2017/2/8.
//  Copyright © 2017年 Yuchi Chen. All rights reserved.
//

#import "ViewController.h"
#import "LocalizationSystem.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)setText
{
    self.titleLabel.text = YCLocalizedString(@"hello");
    [self.nextButton setTitle:YCLocalizedStringFromTable(@"8mA-fu-yPI.normalTitle", @"Main") forState:UIControlStateNormal];
}

#pragma mark - IBAction

- (IBAction)zhHansButtonPressed:(UIButton *)sender
{
    YCSetLanguage(@"zh-Hant");
    
    [self setText];
}

- (IBAction)englishButtonPressed:(UIButton *)sender
{
    YCSetLanguage(@"en");
    
    [self setText];
}

- (IBAction)japaneseButtonPressed:(UIButton *)sender
{
    YCSetLanguage(@"ja");
    
    [self setText];
}

@end
