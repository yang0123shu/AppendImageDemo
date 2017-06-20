//
//  ViewController.m
//  AppendImageDemo
//
//  Created by yangshucheng on 2017/6/13.
//  Copyright © 2017年 yangshucheng. All rights reserved.
//

#import "ViewController.h"
#import "MXImagesShowViewController.h"
@interface ViewController ()

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
- (IBAction)toSecondVC:(id)sender {
    
    [self.navigationController pushViewController:[[MXImagesShowViewController alloc]init] animated:YES];
}


@end
