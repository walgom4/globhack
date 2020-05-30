import 'package:after_layout/after_layout.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sstsoft/controller/menu/arl_info_widget.dart';
import 'package:sstsoft/controller/menu/end_journey_widget.dart';
import 'package:sstsoft/controller/menu/feeling_bad_widget.dart';
import 'package:sstsoft/controller/menu/information_widget.dart';
import 'package:sstsoft/controller/menu/start_journey_widget.dart';
import 'package:sstsoft/controller/menu/wash_hands_widget.dart';
import 'package:sstsoft/controller/transition/fade_route.dart';
import 'package:sstsoft/service/login_service.dart';

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

  ///Validate if work journey is finished
  bool journeyStarted = true;

  ///Login service reference
  LoginService loginService = LoginService();

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
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    this.journeyStarted = await loginService.returnIfUserJourneyIsStarted();
    setState(() {});
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
            _createHeader(),
            _createDrawerItem(
              icon: Icons.settings,
              text: "Configuración",
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.close,
              text: "Cerrar sesión",
              onTap: () {},
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
                FadeRoute(page: WashHandsWidget()),
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
              onTap: () => Navigator.push(
                context,
                FadeRoute(page: FeelingBadWidget()),
              ),
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
              onTap: () => Navigator.push(
                context,
                FadeRoute(page: ArlInfoWidget()),
              ),
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
              onTap: () => Navigator.push(
                context,
                FadeRoute(page: InformationWidget()),
              ),
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
              new Text(
                  this.journeyStarted ? "Finalizar Jornada" : "Iniciar Jornada",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              Icon(
                this.journeyStarted ? MdiIcons.close : MdiIcons.openInNew,
                size: 40.0,
                color: Colors.white,
              ),
              color: Colors.purple,
              onTap: () {
                Widget forwardWidget = this.journeyStarted
                    ? EndJourneyWidget()
                    : StartJourneyWidget();
                Navigator.push(
                  context,
                  FadeRoute(page: forwardWidget),
                );
              },
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

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            minRadius: 40,
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nombre de usuario",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
