import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sstsoft/controller/login_widget.dart';
import 'package:sstsoft/service/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'SSTSoft start page',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
         ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginWidget(title: "SSTSoft"),
      routes: routes,
    );
  }
}
