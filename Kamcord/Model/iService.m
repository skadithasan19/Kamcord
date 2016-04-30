

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "iService.h"


@implementation iService


/**
 @param game is an URL which has the end point.
 @return A block to execute when the app is ready to kick off the task as it assigned.
 */
 + (void)getJsonResponse : (NSString *)urlStr success : (void (^)(id responseDict))success failure:(void(^)(NSError* error))failure
{
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"GET"];
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req addValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forHTTPHeaderField: @"device-token"];
    

    NSURLSessionDataTask * dataTask1 = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(data) {
                success([NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil]);
            } else {
                success(nil);
                NSLog(@"Couldn't reach to the Server. Please Try again Later.");
            }
        });

        
    }];
    
     [dataTask1 resume] ;
    

    
}

/**
 @param game is an Custom Object which has each game info.
 @return A block to execute when the app is ready to kick off the task as it assigned.
 */

+ (void)downloadImageWithURL:(NSString *)imageURL completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    
    NSURLSessionDataTask * dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:imageURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               
                                               if ( !error )
                                               {
                                                   completionBlock(YES,[UIImage imageWithData:data]);
                                                   
                                               } else{
                                                   completionBlock(NO,nil);
                                               }
                                           });
                                           
                                       }];
    
    [dataTask resume] ; // Executed First
}




@end
