import 'package:after_layout/after_layout.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sstsoft/controller/menu/wash_hands_widget.dart';

class PrincipalWidget extends StatefulWidget {
  static const String name = '/principal';

  @override
  _PrincipalWidgetState createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget>
    with AfterLayoutMixin<PrincipalWidget> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  ///Retain scaffold context to view messages
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("SSTSOFT"),
        elevation: 2.0,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem(
              new Text("Lavado de manos",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.hand,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WashHandsWidget()),
              ),
            ),
            makeDashboardItem(
              new Text("Me siento mal",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.ambulance,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.red,
              onTap: () {},
            ),
            makeDashboardItem(
              new Text("ARL",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.transitTransfer,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.orange,
              onTap: () {},
            ),
            makeDashboardItem(
              new Text("Información",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.information,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.cyan,
              onTap: () {},
            ),
            makeDashboardItem(
              new Text("Coronapp",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.copyright,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.teal,
              onTap: () {},
            ),
            makeDashboardItem(
              new Text("Finalizar jornada",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                MdiIcons.close,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.purple,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(Text text, Icon icon,
      {Color color, Function() onTap}) {
    return Card(
      shadowColor: Colors.purple,
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: color),
        child: new InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(child: icon),
              SizedBox(height: 20.0),
              new Center(
                child: text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
