//
//  LoginViewController.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 14/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWViewController.h"
#import "loginclass.h"
@interface OWLoginViewController : UIViewController
{
    loginclass *loginClass;
}
@property OWViewController *controller;
- (IBAction)googleplus:(id)sender;

@end
