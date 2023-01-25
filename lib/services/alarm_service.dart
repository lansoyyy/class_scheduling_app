// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// class AlarmService {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> setAlarms(List<Map<String, dynamic>> alarms) async {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     var initializationSettings = InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);

//     for (var alarm in alarms) {
//       var scheduledTime = DateTime.parse(alarm['time']);
//       var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//           'your channel id', 'your channel name', 'your channel description',
//           importance: Importance.Max, priority: Priority.High);
//       var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//       var platformChannelSpecifics = NotificationDetails(
//           androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//       await flutterLocalNotificationsPlugin.schedule(
//           0,
//           'Alarm',
//           'Time to water your plants',
//           scheduledTime,
//           platformChannelSpecifics);
//     }
//   }

//   Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     return CupertinoAlertDialog(
//       title: Text(title),
//       content: Text(body),
//       actions: <Widget>[
//         CupertinoDialogAction(
//             isDefaultAction: true,
//             onPressed: () {
//               print("");
//             },
//             child: Text('Ok')),
//       ],
//     );
//   }

//   Future onSelectNotification(String payload) async {
//     if (payload != null) {
//       print('notification payload: ' + payload);
//     }
//   }
// }
