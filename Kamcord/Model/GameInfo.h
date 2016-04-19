

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameInfo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) NSString *giD;
/**
 @param dictionary is the single object we get from response after parsing.
 */

-(id)initWithGameinfo:(NSDictionary *)dictionary;

@end
