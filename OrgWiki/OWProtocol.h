//
//  OWProtocol.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWProtocol <NSObject>
typedef void(^Urlresponceblock)(NSString *result, NSError *error);
typedef void(^Urlresponceblocksecond)(BOOL result);
typedef void(^googleLoginBlock)(id googleDetails);
typedef void(^googleLogoutBlock) (BOOL logout);
@end
