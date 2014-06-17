//
//  TFAMemberDatastore.h
//

#import <Foundation/Foundation.h>

@class TFAMember;

@interface TFAMemberDatastore : NSObject

- (id)initWithTestData;
- (NSUInteger)count;
- (TFAMember *)recordAtIndex:(NSUInteger)index;

@end
