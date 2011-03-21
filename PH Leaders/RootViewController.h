//
//  RootViewController.h
//  PH Leaders
//
//  Created by Earljon Hidalgo on 3/21/11.
//  Copyright 2011 Smugappventures Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGODatabase.h"

@interface RootViewController : UITableViewController {
    EGODatabase *database;
    NSArray *leaders;
}

@property (nonatomic, retain) NSArray *leaders;

@end
