

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities


/**
 @return number of required column.
 */
+ (NSInteger) getRowColumnByDevice {
    
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
        return numberOfItemInPad;
    } else
        return numberOfItemInPhone;
    return 0;
}

/**
 @return device UDID which seems to be unique.
 */
+ (NSString *)getDeviceUDID {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}


/**
 @param title is an alert title and message is the designed message to be used for Alert. controller is place where this alert to be shown.
 */

+ (void)showAlertViewIncontroller:(NSString *)title message:(NSString *)message inController:(UIViewController *)controller {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alertController addAction:defaultAction];
    
    [controller presentViewController:alertController animated:YES completion:nil];
}

+ (NSString *)getAPI:(NSString *)pageNo {
    NSString *url = nil;
    if (pageNo && ![pageNo isEqualToString:@""]) {
        url = [NSString stringWithFormat:@"%@count=30&page=%@",API,pageNo];
    } else
        url = [NSString stringWithFormat:@"%@count=30",API];
    
    return url;
}
@end
