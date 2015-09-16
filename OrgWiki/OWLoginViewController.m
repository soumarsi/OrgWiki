//
//  LoginViewController.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 14/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "OWLoginViewController.h"

@interface OWLoginViewController ()

@end

@implementation OWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    loginClass = [[loginclass alloc]init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)googleplus:(id)sender {
    
    [loginClass withblock:^(id googleDetails)
    {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        self.controller = (OWViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"ViewController"];
        [self.navigationController pushViewController:self.controller animated:YES];
        [self.controller initwithValue:googleDetails];
  
    }];
}


@end
