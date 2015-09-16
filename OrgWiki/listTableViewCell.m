//
//  listTableViewCell.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "listTableViewCell.h"

@implementation listTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)listArray: (OWlist *)list
{
    OWlist *listCoreData = list;
    _nameLabel.text = listCoreData.name;
    _nameLabel.font=[UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:21];
    _addressLabel.text = listCoreData.address;
     _addressLabel.font=[UIFont fontWithName:@"AppleSDGothicNeo-Light" size:19];
}
@end
