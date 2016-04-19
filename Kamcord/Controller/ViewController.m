


//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "ViewController.h"
#import "collectionCell.h"
#import "Constants.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *contents;
@end

static NSString *pageNo = @"";

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
    [iService downloadImageWithURL:data completionBlock:^(BOOL succeeded, UIImage *image) {
            cell.photo.image = image;
        }];

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



- (void)loadData {
    
    [iService getJsonResponse:[Utilities getAPI:pageNo] success:^(NSDictionary *responseDict) {

                NSArray *temp = [responseDict valueForKeyPath:@"response.card_models"];
                NSInteger index;
                NSRange myRange = NSMakeRange(self.contents.count, temp.count);
        
                [temp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    GameInfo *data = [[GameInfo alloc] initWithGameinfo:obj];
                    [self.contents addObject:data];
                }];

                index = myRange.location;
                NSMutableArray *indexes = [NSMutableArray array];
                NSInteger i = 0;
                while (i < myRange.length) {
                    [indexes addObject:[NSIndexPath indexPathForItem:index inSection:0]]; index++;  i++;
                }
        
                if (indexes.count > 0) {
                    [self.collectionView performBatchUpdates:^{
                    [self.collectionView insertItemsAtIndexPaths:indexes];
                    } completion:nil];
                }

            pageNo = [responseDict valueForKeyPath:@"response.next_page"];
        
    } failure:^(NSError *error) {
        
        
    }];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // getting the scroll offset
    CGFloat bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height)
    {
        // we are at the bottom
        [self loadData];
    }
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
