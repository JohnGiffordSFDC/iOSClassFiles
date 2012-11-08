//
//  MentionSelectorViewController.h
//  ChatterCheckin
//
//  Created by John Gifford on 10/9/12.
//  Copyright (c) 2012 Model Metrics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFRestAPI.h"

@interface SelectUserViewController : UITableViewController <SFRestDelegate,UISearchBarDelegate, UISearchDisplayDelegate> {
    NSMutableArray *_dataRows;      //Array of User objects
    NSMutableArray *_selectedUsers; //Array of selected User objects
    NSMutableArray *_filteredUsers; //Array of filtered User objects
    NSString *_nextPageURL;
}

@property (nonatomic, retain)NSArray *selectedUsers;

@end
