// import 'dart:developer';
// import 'dart:io' as io;
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';
// import 'package:sizer/sizer.dart';
// import 'package:zohosystem/ui/welcomeScreen/view/welcomeScreen.dart';
//
// import 'firebase_options.dart';
//
// String? myDeviceToken;
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// /// Initialize Local Notifications
// Future<void> initLocalNotifications() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//
//   const DarwinInitializationSettings initializationSettingsIOS =
//       DarwinInitializationSettings(
//           requestAlertPermission: true,
//           requestBadgePermission: true,
//           requestSoundPermission: true,
//           defaultPresentSound: true,
//           requestCriticalPermission: true);
//
//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
//
// /// Background handler for FCM
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   log("🔧 Handling background message: ${message.messageId}");
//
//   if (message.data['sender_token'] != myDeviceToken) {
//     await _showLocalNotification(message);
//   }
// }
//
// /// Show notification with image support
// Future<void> _showLocalNotification(RemoteMessage message) async {
//   String? title = message.notification?.title ?? message.data['title'] ?? '';
//   String? body = message.notification?.body ?? message.data['body'] ?? '';
//
//   String? bigImage =
//       message.data['bigImage'] ?? message.notification?.android?.imageUrl;
//   String? smallImage = message.data['smallImage'];
//
//   log("🔔 Showing Local Notification - Title: $title, Body: $body, BigImage: $bigImage, SmallImage: $smallImage");
//
//   final AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'basic_channel',
//     'Basic Notifications',
//     channelDescription: 'Used for basic notifications',
//     importance: Importance.high,
//     priority: Priority.high,
//     playSound: true,
//     styleInformation: bigImage != null
//         ? BigPictureStyleInformation(
//             FilePathAndroidBitmap(bigImage),
//             contentTitle: title,
//             summaryText: body,
//             largeIcon:
//                 smallImage != null ? FilePathAndroidBitmap(smallImage) : null,
//           )
//         : null,
//   );
//
//   const DarwinNotificationDetails iOSPlatformChannelSpecifics =
//       DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//           criticalSoundVolume: 100);
//
//   final NotificationDetails platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );
//
//   await flutterLocalNotificationsPlugin.show(
//     DateTime.now().millisecondsSinceEpoch ~/ 1000,
//     title,
//     body,
//     platformChannelSpecifics,
//     payload: message.data.toString(),
//   );
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     log("✅ Firebase initialized successfully");
//   } catch (e, stack) {
//     log("❌ Firebase initialization failed: $e");
//     log(stack.toString());
//   }
//
//   await initLocalNotifications();
//
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//     announcement: true,
//     carPlay: true,
//     criticalAlert: true,
//     provisional: false,
//   );
//
//   switch (settings.authorizationStatus) {
//     case AuthorizationStatus.authorized:
//       log('✅ User granted permission');
//       break;
//     case AuthorizationStatus.provisional:
//       log('🟡 User granted provisional permission');
//       break;
//     case AuthorizationStatus.denied:
//     case AuthorizationStatus.notDetermined:
//       log('❌ User denied or has not accepted notification permission');
//       break;
//   }
//
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     initMobilisten();
//
//     FirebaseMessaging.instance.getToken().then((token) {
//       myDeviceToken = token;
//       log("📱 Device Token: $myDeviceToken");
//     });
//
//     /// Foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       log('📩 Foreground message received: ${message.notification?.title}');
//       log('📦 Data: ${message.data}');
//
//       if (message.data['sender_token'] != myDeviceToken) {
//         await _showLocalNotification(message);
//       }
//     });
//
//     /// Background messages handled above in main()
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       log("🟢 Notification tapped from background: ${message.notification?.title}");
//     });
//
//     checkInitialMessage();
//   }
//
//   Future<void> checkInitialMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null &&
//         initialMessage.data['sender_token'] != myDeviceToken) {
//       await _showLocalNotification(initialMessage);
//     }
//   }
//
//   Future<void> initMobilisten() async {
//     if (io.Platform.isIOS || io.Platform.isAndroid) {
//       String appKey;
//       String accessKey;
//
//       if (io.Platform.isIOS) {
//         appKey =
//             "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
//         accessKey =
//             "Z8m6sGDVrZSyhGVPLMQblFvJVta91N8s3L7TfKUZF3ALV9vuYrk7zvSkhsjCDyJVzs0kpTHr%2BNL4EywBDGjLLq%2BNBSL5S6EIYo7qaRZ%2BUtqvw0sQwAc8%2FVItA1uTffRQDFsjkD%2BrRRjiqP8rJ0kE%2F84wko8u5PhNE8IA0L0udBo%3D";
//       } else {
//         appKey =
//             "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
//         accessKey =
//             "eMWfJMMaw4S%2BmOFdVlYcPQxaGAaPqICx4NOPeXfDBL1iYyRj7P8wr7XsIeecrPLmV9Q7WCf1H2hpgaTyq8g2Gew%2BBQnAx7jRGANkOeCzQclDrqeiLmkU%2BTvagdVJsTq17%2F3zPFz1ZAInV%2F%2BNfM5htGasAerateoQ";
//       }
//
//       try {
//         await ZohoSalesIQ.init(appKey, accessKey);
//         debugPrint("✅ ZohoSalesIQ initialized successfully");
//         ZohoSalesIQ.launcher.show(VisibilityMode.never);
//       } catch (error) {
//         debugPrint("❌ ZohoSalesIQ Init Error: $error");
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Zoho System',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const Welcomescreen(),
//       );
//     });
//   }
// }

import 'dart:developer';
import 'dart:io' as io;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/welcomeScreen/view/welcomeScreen.dart';

import 'firebase_options.dart';

String? myDeviceToken;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Initialize Local Notifications
Future<void> initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          defaultPresentSound: true,
          requestCriticalPermission: true);

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

/// Background handler for FCM
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("🔧 Handling background message: ${message.messageId}");

  if (message.data['sender_token'] != myDeviceToken) {
    await _showLocalNotification(message);
  }
}

/// Show notification with image support
Future<void> _showLocalNotification(RemoteMessage message) async {
  String? title = message.notification?.title ?? message.data['title'] ?? '';
  String? body = message.notification?.body ?? message.data['body'] ?? '';

  String? bigImage =
      message.data['bigImage'] ?? message.notification?.android?.imageUrl;
  String? smallImage = message.data['smallImage'];

  log("🔔 Showing Local Notification - Title: $title, Body: $body, BigImage: $bigImage, SmallImage: $smallImage");

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'basic_channel',
    'Basic Notifications',
    channelDescription: 'Used for basic notifications',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    styleInformation: bigImage != null
        ? BigPictureStyleInformation(
            FilePathAndroidBitmap(bigImage),
            contentTitle: title,
            summaryText: body,
            largeIcon:
                smallImage != null ? FilePathAndroidBitmap(smallImage) : null,
          )
        : null,
  );

  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          criticalSoundVolume: 100);

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    body,
    platformChannelSpecifics,
    payload: message.data.toString(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔒 Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log("✅ Firebase initialized successfully");
  } catch (e, stack) {
    log("❌ Firebase initialization failed: $e");
    log(stack.toString());
  }

  await initLocalNotifications();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    announcement: true,
    carPlay: true,
    criticalAlert: true,
    provisional: false,
  );

  switch (settings.authorizationStatus) {
    case AuthorizationStatus.authorized:
      log('✅ User granted permission');
      break;
    case AuthorizationStatus.provisional:
      log('🟡 User granted provisional permission');
      break;
    case AuthorizationStatus.denied:
    case AuthorizationStatus.notDetermined:
      log('❌ User denied or has not accepted notification permission');
      break;
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initMobilisten();

    FirebaseMessaging.instance.getToken().then((token) {
      myDeviceToken = token;
      log("📱 Device Token: $myDeviceToken");
    });

    /// Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log('📩 Foreground message received: ${message.notification?.title}');
      log('📦 Data: ${message.data}');

      if (message.data['sender_token'] != myDeviceToken) {
        await _showLocalNotification(message);
      }
    });

    /// Background messages handled above in main()

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("🟢 Notification tapped from background: ${message.notification?.title}");
    });

    checkInitialMessage();
  }

  Future<void> checkInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null &&
        initialMessage.data['sender_token'] != myDeviceToken) {
      await _showLocalNotification(initialMessage);
    }
  }

  Future<void> initMobilisten() async {
    if (io.Platform.isIOS || io.Platform.isAndroid) {
      String appKey;
      String accessKey;

      if (io.Platform.isIOS) {
        appKey =
            "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
        accessKey =
            "Z8m6sGDVrZSyhGVPLMQblFvJVta91N8s3L7TfKUZF3ALV9vuYrk7zvSkhsjCDyJVzs0kpTHr%2BNL4EywBDGjLLq%2BNBSL5S6EIYo7qaRZ%2BUtqvw0sQwAc8%2FVItA1uTffRQDFsjkD%2BrRRjiqP8rJ0kE%2F84wko8u5PhNE8IA0L0udBo%3D";
      } else {
        appKey =
            "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
        accessKey =
            "eMWfJMMaw4S%2BmOFdVlYcPQxaGAaPqICx4NOPeXfDBL1iYyRj7P8wr7XsIeecrPLmV9Q7WCf1H2hpgaTyq8g2Gew%2BBQnAx7jRGANkOeCzQclDrqeiLmkU%2BTvagdVJsTq17%2F3zPFz1ZAInV%2F%2BNfM5htGasAerateoQ";
      }

      try {
        await ZohoSalesIQ.init(appKey, accessKey);
        debugPrint("✅ ZohoSalesIQ initialized successfully");
        ZohoSalesIQ.launcher.show(VisibilityMode.never);
      } catch (error) {
        debugPrint("❌ ZohoSalesIQ Init Error: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Advice Centre',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Welcomescreen(),
      );
    });
  }
}
