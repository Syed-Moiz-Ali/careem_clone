// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:turf_user/config/global.dart';

// import '../user_service.dart';
// import 'notification_channels.dart';
// import 'notification_utils.dart';

// class FCMService {
//   static Future<void> requestPermission() async {
//     NotificationSettings settings =
//         await FirebaseMessaging.instance.requestPermission();

//     // Check if permission was granted or provisional
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       debugPrint('User granted provisional permission');
//     } else {
//       debugPrint('User declined permission');

//       // Using permission_handler to check the current notification permission status
//       bool isDeniedForever = await _checkPermissionStatus();

//       // If denied forever, open app settings
//       // if (isDeniedForever) {
//       bool bottomSheetIsShown = true;
//       while (await _checkPermissionStatus() != false) {
//         debugPrint('Permission denied forever. Opening app settings...');
//         if (bottomSheetIsShown == true) {
//           bottomSheetIsShown = false;
//           await Turf.customBottomSheet(
//               icon: Icons.settings,
//               title: 'Notification',
//               description: 'Open notification settings',
//               btnText: 'Open',
//               onCancel: () {
//                 bottomSheetIsShown = true;
//               },
//               onTap: () {
//                 openAppSettings();
//                 // bottomSheetIsShown = true;
//               });
//           await Future.delayed(Duration(seconds: 3)); // Delay between requests
//         }
//       }

//       // } else {
//       //   // Otherwise, keep requesting permission
//       //   while (await _checkPermissionStatus() != PermissionStatus.granted) {
//       //     debugPrint('Permission denied, requesting again...');
//       //     await FirebaseMessaging.instance.requestPermission();
//       //     await Future.delayed(Duration(seconds: 1)); // Delay between requests
//       //   }
//       // }
//     }
//   }

// // Function to check the current notification permission status using permission_handler
//   static Future<bool> _checkPermissionStatus() async {
//     PermissionStatus status = await Permission.notification.status;

//     // If permission is permanently denied
//     if (status == PermissionStatus.denied ||
//         status == PermissionStatus.permanentlyDenied) {
//       return true; // Permission is denied forever, ask the user to open settings
//     }

//     // If permission is granted
//     return false;
//   }

//   static Future<void> updateFCMToken() async {
//     String? token = await FirebaseMessaging.instance.getToken();
//     debugPrint("FCM Token: $token");
//     if (token != null) {
//       // Replace with your API endpoint
//       Map<String, dynamic> body = {
//         'fcmToken': token,
//       };
//       await UserService.updateUserDetails(body);
//     }

//     // You can update the token to your backend here if necessary
//   }

//   static void handleFCMMessages(FlutterLocalNotificationsPlugin notification) {
//     FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//       debugPrint('Received message: ${event.notification?.title}');
//       await pushNotification(event, notification);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
//       debugPrint(event.toString());
//       debugPrint(event.data.toString());
//       debugPrint(event.notification.toString());
//       debugPrint('Message clicked!');
//     });

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   @pragma('vm:entry-point')
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     debugPrint("Handling a background message: ${message.messageId}");
//   }

//   static Future<void> pushNotification(RemoteMessage message,
//       FlutterLocalNotificationsPlugin notification) async {
//     String? imageUrl = message.notification?.android?.imageUrl ??
//         message.notification?.apple?.imageUrl;

//     var bigPictureStyleInformation = imageUrl != null
//         ? await NotificationUtils.getBigPictureStyleInformation(
//             imageUrl, message)
//         : null;

//     final platformChannelSpecifics = NotificationUtils.buildNotificationDetails(
//       channelId: _getChannelForMessage(message),
//       bigPictureStyleInformation: bigPictureStyleInformation,
//     );

//     await notification.show(
//       1,
//       message.notification?.title ?? 'No Title',
//       message.notification?.body ?? 'No Body',
//       platformChannelSpecifics,
//       payload: message.data.toString(),
//     );
//   }

//   static String _getChannelForMessage(RemoteMessage message) {
//     // Logic to decide which channel to use for the notification
//     if (message.data['type'] == 'chat') {
//       return NotificationChannels.chatChannelId;
//     } else if (message.data['type'] == 'promotion') {
//       return NotificationChannels.promotionChannelId;
//     } else if (message.data['type'] == 'alert') {
//       return NotificationChannels.alertChannelId;
//     }
//     return NotificationChannels.generalChannelId; // Default channel
//   }
// }
