//
//  loginclass.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 14/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "loginclass.h"

@implementation loginclass
static NSString * const kClientId = @"550678812463-42e8meav979pnds49baud2iv9athoe8n.apps.googleusercontent.com";

-(void) withblock:(googleLoginBlock)response
{
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.delegate = self;
    signIn.shouldFetchGoogleUserEmail = YES;
    signIn.clientID = kClientId;
    signIn.scopes = [NSArray arrayWithObjects:kGTLAuthScopePlusLogin,nil];
    signIn.actions = [NSArray arrayWithObjects:@"http://schemas.google.com/ListenActivity",nil];
    [signIn authenticate];
    
    _googleresponce = [response copy];
}
- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth
                   error:(NSError *)error
{
    if (!error)
    {
        GTLQueryPlus *query = [GTLQueryPlus queryForPeopleGetWithUserId:@"me"];
       
        // 1. Create a |GTLServicePlus| instance to send a request to Google+.
        GTLServicePlus* plusService = [[GTLServicePlus alloc] init] ;
        plusService.retryEnabled = YES;
        
        // 2. Set a valid |GTMOAuth2Authentication| object as the authorizer.
        [plusService setAuthorizer:[GPPSignIn sharedInstance].authentication];
        
        // 3. Use the "v1" version of the Google+ API.*
        plusService.apiVersion = @"v1";
        [plusService executeQuery:query
                completionHandler:^(GTLServiceTicket *ticket,
                                    GTLPlusPerson *person,
                                    NSError *error) {
                    if (error) {
                        //Handle Error
                    } else {
                        NSLog(@"Email= %@", [GPPSignIn sharedInstance].authentication.userEmail);
                        NSLog(@"GoogleID=%@", person.identifier);
                        NSLog(@"User Name=%@", [person.name.givenName stringByAppendingFormat:@" %@", person.name.familyName]);
                        NSLog(@"Gender=%@", person.gender);
                        NSLog(@"Profile Image=%@", person.image.url);
                        NSLog(@"RefreshToken=%@", auth.refreshToken);
                        NSLog(@"AccessToken=%@", auth.accessToken);
                        NSLog(@"ExpiresIn=%@", auth.expiresIn);
                        
                        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[GPPSignIn sharedInstance].authentication.userEmail, @"userEmail", person.identifier, @"GoogleID",[person.name.givenName stringByAppendingFormat:@" %@", person.name.familyName], @"UserName", person.gender, @"Gender",person.image.url,@"userProfileImage",auth.refreshToken,@"RefreshToken",auth.accessToken,@"AccessToken",auth.expiresIn,@"ExpiresIn",nil];
                        
                        _googleresponce(dict);
                    }
                }];
        
        NSLog(@"Google+ login successful");
    }
    else
    {
        NSLog(@"Error: %@", error);
    }
    

}
-(void) withBlock:(googleLogoutBlock) response
{
     [[GPPSignIn sharedInstance] signOut];
    
    response(YES);
}
@end
