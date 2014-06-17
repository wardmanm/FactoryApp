//
//  TFAMember.m
//

#import "TFAMember.h"

@implementation TFAMember

- (id)initWithDictionary:(NSDictionary *)properties {
  self = [super init];
  if (self) {
    _objectId = properties[@"objectId"];
    _ama = properties[@"AMA"];
    _bio = properties[@"BIO"];
    _email = properties[@"EMAIL"];
    _fb = properties[@"FB"];
    _name = properties[@"NAME"];
    _twitter = properties[@"TWITTER"];
    _pic = properties[@"pic"];
  }
  return self;
}

@end