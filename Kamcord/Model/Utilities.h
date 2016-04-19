

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
/**
 @return number of required column.
 */

+ (NSInteger) getRowColumnByDevice;

/**
 @return device UDID which seems to be unique.
 */
+ (NSString *)getDeviceUDID;

/**
 @param title is an alert title and message is the designed message to be used for Alert. controller is place where this alert to be shown.
 */

+ (void)showAlertViewIncontroller:(NSString *)title message:(NSString *)message inController:(UIViewController *)controller;

/**
 @param pageNo is the next page we will go.
 @return url string based on the page.
 */
 + (NSString *)getAPI:(NSString *)pageNo;

@end
