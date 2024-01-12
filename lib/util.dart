import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final String body;
  final String title;

  MyNotification(
    this.flutterLocalNotificationsPlugin,
    this.body,
    this.title,
  );

  Future notification() async {
    var _androidNotification =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var _init = InitializationSettings(android: _androidNotification);
    await flutterLocalNotificationsPlugin.initialize(_init);
    final _androidNotificationDetails = AndroidNotificationDetails(
      "@ecfile",
      "Ecfile",
      importance: Importance.max,
      priority: Priority.high,
    );
    final _notification =
        NotificationDetails(android: _androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(0, title, body, _notification);
  }
}

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
    materialBanner(
  BuildContext context,
  String title,
  String subtitle,
) {
  return ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
    padding: EdgeInsets.all(8),
    content: Card(
      color: Colors.green.shade300,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () =>
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        icon: Icon(
          Icons.close,
          color: Colors.red,
        ),
      ),
    ],
    onVisible: () => Future.delayed(Duration(seconds: 3)).then(
      (value) => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
    ),
  ));
}
