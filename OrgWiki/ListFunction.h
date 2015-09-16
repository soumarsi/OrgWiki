//
//  ListFunction.h
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWProtocol.h"
#import "coredatasavefunction.h"
@interface ListFunction : NSObject<NSURLSessionDelegate>
{
    Urlresponceblocksecond _response;
}

@property (strong, nonatomic) NSMutableArray *listingArray;
@property (strong, nonatomic) coredatasavefunction *coreDataValue;
-(void) withblock:(Urlresponceblocksecond) response;
@end
