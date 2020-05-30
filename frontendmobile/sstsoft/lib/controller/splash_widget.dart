import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/controller/login_widget.dart';
import 'package:sstsoft/controller/principal_widget.dart';
import 'package:sstsoft/service/login_service.dart';

class SplashWidget extends StatefulWidget {
  static final name = "splash";
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with AfterLayoutMixin<SplashWidget> {
  LoginService loginService = LoginService();

  @override
  void afterFirstLayout(BuildContext context) async {
    bool logged = await loginService.userSessionAvailable();
    if(logged){
      Navigator.of(context).pushNamedAndRemoveUntil(
        PrincipalWidget.name, (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil(
        LoginWidget.name, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.6, 0.9],
              colors: GeneralCons.splashDegradeColor)),
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green[10]),
                ),
              ],
            )),
      ),
    )));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'sst',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 60,
            fontWeight: FontWeight.w700,
            color: GeneralCons.baseColor,
          ),
          children: [
            TextSpan(
              text: 'soft',
              style: TextStyle(color: GeneralCons.secondaryColor, fontSize: 60),
            ),
          ]),
    );
  }
}
