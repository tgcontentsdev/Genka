//
//  ViewController.m
//  Genka!
//
//  Created by tgaiacontentsdev on 2016/01/28.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(IBAction)tourokuButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tourokuButtonAction:(id)sender{
    [self performSegueWithIdentifier:@"tourokuView" sender:self];
}

@end
