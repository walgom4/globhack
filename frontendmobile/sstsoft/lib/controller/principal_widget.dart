import 'package:after_layout/after_layout.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PrincipalWidget extends StatefulWidget {
  static const String name = '/principal';

  @override
  _PrincipalWidgetState createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget>
    with AfterLayoutMixin<PrincipalWidget> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }

  @override
  void initState() {
    // _firebaseMessaging.configure(
    //   onBackgroundMessage: _PrincipalWidgetState.backgroundMessageHandler,
    //   onMessage: (Map<String, dynamic> message) async {},
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
    // _firebaseMessaging.getToken().then((String token) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static Future<dynamic> backgroundMessageHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
    // locator<NavigationService>().navigateTo(BolsaAvaluosWidget.name);
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //                   BolsaAvaluosWidget.name, (Route<dynamic> route) => false);
  }
}
