//
//  listTableViewCell.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWlist.h"
@interface listTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

-(void)listArray: (OWlist *)list;

@end
