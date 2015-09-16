//
//  ListFunction.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "ListFunction.h"
#define List_url @"http://esolzdemos.com/lab4/demo_admin1/action.php?mode=businessInfo"
//#define List_url @"https://staging.theorgwiki.com/api/employees/?page_size=0"
@implementation ListFunction

-(void) withblock:(Urlresponceblocksecond) response
{
    _listingArray = [[NSMutableArray alloc]init];
    _coreDataValue = [[coredatasavefunction alloc]init];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * URL = [NSURL URLWithString:List_url];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:URL
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];                                                            
                                                            _listingArray = dict[@"packagetypedata"];
                                                            [_coreDataValue selfFunction:_listingArray withblock:^(NSString *result, NSError *error) {
                                                                
                                                                _response(YES);
                                                                
                                                            }];
                                                        }
                                                        
                                                    }];
    _response = [response copy];
    [dataTask resume];

    
}
@end
