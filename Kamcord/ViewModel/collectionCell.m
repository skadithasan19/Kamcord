
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "collectionCell.h"
#import "Constants.h"

@implementation collectionCell

/**
 @param data. creating cell based on Gameinfo
 */
-(void)createCellWithInfo:(GameInfo *)data {
    
    [self.titleLabel setText:data.name];
    self.photo.layer.masksToBounds = NO;
    self.photo.layer.cornerRadius = 10;
    self.photo.clipsToBounds = YES;
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = NO;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
