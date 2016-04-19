
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "GameInfo.h"

@implementation GameInfo

/**
 @param dictionary is the single object we get from response after parsing.
 */
- (id)initWithGameinfo:(NSDictionary *)dictionary {
    self = [super init];
    if(self)
    {
        self.name = [dictionary valueForKeyPath:@"game.name"];
        self.iconURL = [dictionary valueForKeyPath:@"game.icons.regular"];
        self.giD = [dictionary valueForKeyPath:@"game.id"];
    }
    return self;
}


@end
