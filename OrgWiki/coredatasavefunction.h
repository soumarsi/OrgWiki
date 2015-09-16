//
//  coredatasavefunction.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWProtocol.h"
#import "AppDelegate.h"
#import "OWlist.h"
@interface coredatasavefunction : NSObject


@property (strong, nonatomic) AppDelegate *OWAppdelegate;
@property (strong, nonatomic) OWlist *list;
-(void)selfFunction:(NSMutableArray *)fetchArray withblock:(Urlresponceblock) response;
@end
