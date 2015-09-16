
//
//  coredatasavefunction.m
//  OrgWiki
//
//  Created by Soumarsi Kundu on 11/09/15.
//  Copyright (c) 2015 ESOLZ. All rights reserved.
//

#import "coredatasavefunction.h"

@implementation coredatasavefunction

-(void)selfFunction:(NSMutableArray *)fetchArray withblock:(Urlresponceblock) response
{
    _OWAppdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *manageobjectcon = [_OWAppdelegate managedObjectContext];
    NSLog(@"count-=-=- %lu", (unsigned long)fetchArray.count);
    
        
        for (NSDictionary *newObjectDict in fetchArray) {
            
            _list = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:manageobjectcon];
            
            _list.listid = newObjectDict[@"id"];
            _list.name = newObjectDict[@"name"];
            _list.address = newObjectDict[@"address"];
            _list.field1 = newObjectDict[@"field1"];
            _list.field2 = newObjectDict[@"field2"];
            _list.field3 = newObjectDict[@"field3"];
            _list.field4 = newObjectDict[@"field4"];
            _list.field5 = newObjectDict[@"field5"];
            _list.field6 = newObjectDict[@"field6"];
            _list.field7 = newObjectDict[@"field7"];
            _list.field8 = newObjectDict[@"field8"];
            _list.field9 = newObjectDict[@"field9"];
            _list.field10 = newObjectDict[@"field10"];
            _list.field11 = newObjectDict[@"field11"];
            _list.field12 = newObjectDict[@"field12"];
            _list.field13 = newObjectDict[@"field13"];
            
            [_OWAppdelegate saveContext];
        }
        
    response(@"YES",nil);
}
@end
