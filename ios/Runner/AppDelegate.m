#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
@import Firebase;
@import UserNotifications;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Configure Firebase
    if ([FIRApp defaultApp] == nil) {
        [FIRApp configure];
    }

    // Set Firebase messaging delegate
    [FIRMessaging messaging].delegate = self;

    [GeneratedPluginRegistrant registerWithRegistry:self];

    // Configure notification center
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;

        // Request authorization with completion handler
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge)
                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                  if (!error) {
                                      NSLog(@"Notification authorization granted: %d", granted);
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          [[UIApplication sharedApplication] registerForRemoteNotifications];
                                      });
                                  } else {
                                      NSLog(@"Notification authorization error: %@", error);
                                  }
                              }];
    } else {
        // Fallback for iOS 9
        UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }

    // Set auto-init enabled
    [FIRMessaging messaging].autoInitEnabled = YES;

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

#pragma mark - Remote Notification Registration

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSLog(@"Successfully registered for remote notifications with device token");

    // Set the APNS token for Firebase Messaging
    [[FIRMessaging messaging] setAPNSToken:deviceToken type:FIRMessagingAPNSTokenTypeUnknown];

    // You can also get the token string for debugging
    const char *data = [deviceToken bytes];
    NSMutableString *tokenString = [NSMutableString string];
    for (NSUInteger i = 0; i < [deviceToken length]; i++) {
        [tokenString appendFormat:@"%02.2hhX", data[i]];
    }
    NSLog(@"APNS Device Token: %@", tokenString);
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

    NSLog(@"Failed to register for remote notifications: %@", error);
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    NSLog(@"FCM registration token: %@", fcmToken);
}

@end