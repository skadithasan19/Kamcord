


//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    NSMutableDictionary *imagesDictionary;
}

@property (nonatomic, strong)NSMutableArray *contents;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.contents = [NSMutableArray new];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.contents count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cvCell";
    collectionCell *cell = (collectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    GameInfo *data = [self.contents objectAtIndex:indexPath.row];
    [cell createCellWithInfo:data];
    if([imagesDictionary valueForKey:data.iconURL]) {
        cell.photo.image = [imagesDictionary valueForKey:data.iconURL];
    } else {
        [iService downloadImageWithURL:data.iconURL completionBlock:^(BOOL succeeded, UIImage *image) {
            cell.photo.image = image;
            [imagesDictionary setObject:image forKey:data.iconURL];
        }];
    }

    return cell;
 
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  
    GameInfo *game = [self.contents objectAtIndex:indexPath.item];
    [Utilities showAlertViewIncontroller:game.name message:[NSString stringWithFormat:@"\nYou've selected %@, game with game_id: %@", game.name, game.giD] inController:self];
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return leadingSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return trailingSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float width = (screenSize.width - ([Utilities getRowColumnByDevice]+1 )  * interItemSpacing)/[Utilities getRowColumnByDevice];
    return CGSizeMake(width, cellHeight);
}


// Layout: Set Edges
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(leftPadding,topPadding,bottomPadding,rightPadding);
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // getting the scroll offset
    CGFloat bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height)
    {
        // we are at the bottom
        [GameManager loadDataIn:self.collectionView withData:self.contents];
    }
  

}



@end
