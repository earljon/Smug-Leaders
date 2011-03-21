//
//  WikiViewController.h
//  PH Leaders
//
//  Created by Earljon Hidalgo on 3/21/11.
//  Copyright 2011 Smugappventures. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WikiViewController : UIViewController {
    IBOutlet UIWebView *web;
    NSString *url;
}

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) UIWebView *web;
@end
