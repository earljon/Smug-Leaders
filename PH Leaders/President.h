//
//  President.h
//  PH Leaders
//
//  Created by Earljon Hidalgo on 3/21/11.
//  Copyright 2011 Smugappventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface President : NSObject {
    NSString *name;
    NSString *from;
    NSString *to;
    NSString *imageFile;
    NSString *wikiUrl;
    int leaderId;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *to;
@property (nonatomic, retain) NSString *imageFile;
@property (nonatomic, retain) NSString *wikiUrl;
@property (nonatomic) int leaderId;
@end
