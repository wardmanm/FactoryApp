//
//  TFAMemberDatastore.h
//
//  Created by iOyster on 6/3/14.
//  Copyright (c) 2014 Team FactoryApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TFAMember;

@interface TFAMemberDatastore : NSObject

- (id)initWithTestData;
- (NSUInteger)count;
- (TFAMember *)recordAtIndex:(NSUInteger)index;

@end
