//
//  GameManager.h
//  Kamcord
//
//  Created by Md Adit Hasan on 4/21/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface GameManager : NSObject

+ (void)loadDataIn:(UICollectionView *)collectionView withData:(NSMutableArray *)contents;

@end
