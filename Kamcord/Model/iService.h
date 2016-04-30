
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GameInfo.h"
@interface iService : NSObject
/**
 @param game is an URL which has the end point.
 @return A block to execute when the app is ready to kick off the task as it assigned.
 */
+ (void)getJsonResponse : (NSString *)urlStr success : (void (^)(id responseDict))success failure:(void(^)(NSError* error))failure;

/**
 @param game is an Custom Object which has each game info.
 @return A block to execute when the app is ready to kick off the task as it assigned.
 */
+ (void)downloadImageWithURL:(NSString *)imageURL completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;;


@end
