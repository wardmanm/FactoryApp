//
//  TFAMember.h
//
//  Created by iOyster on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFAMember : NSObject

@property NSString *name;
@property NSString *objectId;
@property NSString *ama;
@property NSString *twitter;
@property NSString *bio;
@property NSString *email;
@property NSString *fb;
@property UIImage *pic;

- (id)initWithDictionary:(NSDictionary *)properties;

@end
