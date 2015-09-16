//
//  ViewController.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listTableViewCell.h"
#import "ListFunction.h"
#import <GooglePlus/GooglePlus.h>
#import "AppDelegate.h"
#import "loginclass.h"
@interface OWViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    loginclass *logoutclass;
}
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UITableView *listTable;
@property (strong, nonatomic) ListFunction *listData;
@property (strong, nonatomic) AppDelegate *OWAppdelegate;
@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableArray *allDataArray;
@property (strong, nonatomic) NSArray *searchArray;
@property (strong,nonatomic) NSString *search_Text;
@property NSManagedObjectContext *manageobjectcontext;
@property NSFetchRequest *fetchrequst;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
- (IBAction)logout:(id)sender;
@property (strong) NSDictionary *userDetails;
-(void)initwithValue:(NSDictionary *)detailsValue;
@end

