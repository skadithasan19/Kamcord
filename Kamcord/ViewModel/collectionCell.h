

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)createCellWithInfo:(GameInfo *)data;

@end
