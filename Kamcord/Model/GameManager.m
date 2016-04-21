//
//  GameManager.m
//  Kamcord
//
//  Created by Md Adit Hasan on 4/21/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager


+ (void)loadDataIn:(UICollectionView *)collectionView withData:(NSMutableArray *)contents {
   
    static NSString *pageNo = @"";
    
    [iService getJsonResponse:[Utilities getAPI:pageNo] success:^(NSDictionary *responseDict) {
        
        NSArray *temp = [responseDict valueForKeyPath:@"response.card_models"];
        NSInteger index;
        NSRange myRange = NSMakeRange(contents.count, temp.count);
        
        [temp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GameInfo *data = [[GameInfo alloc] initWithGameinfo:obj];
            [contents addObject:data];
        }];
        
        index = myRange.location;
        NSMutableArray *indexes = [NSMutableArray array];
        NSInteger i = 0;
        while (i < myRange.length) {
            [indexes addObject:[NSIndexPath indexPathForItem:index inSection:0]]; index++;  i++;
        }
        
        if (indexes.count > 0) {
            [collectionView performBatchUpdates:^{
                [collectionView insertItemsAtIndexPaths:indexes];
            } completion:nil];
        }
        
        pageNo = [responseDict valueForKeyPath:@"response.next_page"];
        
    } failure:^(NSError *error) {
        
        
    }];
}
@end
