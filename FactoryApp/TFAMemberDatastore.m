//
//  TFAMemberDatastore.m
//

#import "TFAMemberDatastore.h"
#import "TFAMember.h"

@interface TFAMemberDatastore () {
  NSMutableArray *members;
  NSURLConnection *connection;
  NSMutableData *jsonData;
}
@end

@implementation TFAMemberDatastore

- (id)init {
  self = [super init];
  if (self) {
    // Parse information and login
      NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.parse.com/1/classes/member"]];
    [request setValue:@"nq5kBbLQqWjW7taX9UVLoiEkyCDJ8gONbw92Fx6d" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:@"hwz7WjcntmkHEphq0JazkvX1WoN4jcLi3IKo5UbY" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *allMembers = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // instantiates the member objet to be populated with parse info
    members = [NSMutableArray array];
    for (NSDictionary *memberDictionary in allMembers[@"results"]) {
      request.URL = [NSURL URLWithString:memberDictionary[@"pic"][@"url"]];
      NSLog(@"Downlading %@", memberDictionary[@"pic"][@"url"]);
      NSData *imageData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
      UIImage *memberImage = [UIImage imageWithData:imageData];
      NSMutableDictionary *memDPic = [memberDictionary mutableCopy];
      memDPic[@"pic"] = memberImage;
      [members addObject:[[TFAMember alloc] initWithDictionary:memDPic]];
    }
  }
  
  return self;
}

- (id)initWithTestData {
  // test data
  self = [super init];
  if (self) {
    NSDictionary *trentonDictionary = @{@"ama": @"",
                                        @"bio": @"",
                                        @"email": @"",
                                        @"fb": @"",
                                        @"NAME": @"Trenton Broughton",
                                        @"twitter": @"",
                                        @"pic": [UIImage imageNamed:@"Black-Mage"]};
    NSDictionary *garrickDictionary = @{@"ama": @"",
                                        @"bio": @"",
                                        @"email": @"",
                                        @"fb": @"",
                                        @"NAME": @"Garrick Pohl",
                                        @"twitter": @"",
                                        @"pic": [UIImage imageNamed:@"red-mage"]};
    NSDictionary *ronDictionary = @{@"ama": @"",
                                    @"bio": @"",
                                    @"email": @"",
                                    @"fb": @"",
                                    @"NAME": @"Ron VanSurksum",
                                    @"twitter": @"",
                                    @"pic": [UIImage imageNamed:@"white-mage"]};
    members = [@[[[TFAMember alloc] initWithDictionary:trentonDictionary],
               [[TFAMember alloc] initWithDictionary:garrickDictionary],
               [[TFAMember alloc] initWithDictionary:ronDictionary]] mutableCopy];
  }
  return self;
}

- (NSUInteger)count {
    // finds the number of members in the members object to send to the table for population
    return [members count];
}

- (TFAMember *)recordAtIndex:(NSUInteger)index {
  return members[index];
}

@end
