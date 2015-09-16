//
//  loginclass.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 14/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWProtocol.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
@interface loginclass : NSObject<GPPSignInDelegate>
{
    
    googleLoginBlock _googleresponce;
    googleLogoutBlock _googleresponceLogout;
}

-(void) withblock:(googleLoginBlock)response;
-(void) withBlock:(googleLogoutBlock) response;
@end
