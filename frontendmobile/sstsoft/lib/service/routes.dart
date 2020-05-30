import 'package:flutter/material.dart';
import 'package:sstsoft/controller/forgot_password_widget.dart';
import 'package:sstsoft/controller/login_widget.dart';
import 'package:sstsoft/controller/principal_widget.dart';
import 'package:sstsoft/controller/register_widget.dart';
import 'package:sstsoft/controller/splash_widget.dart';

final routes = <String, WidgetBuilder>{
  LoginWidget.name: (context) => LoginWidget(),
  PrincipalWidget.name: (context) => PrincipalWidget(),
  ForgotPasswordWidget.name: (context) => ForgotPasswordWidget(),
  RegisterWidget.name: (context) => RegisterWidget(),
  SplashWidget.name: (context) => SplashWidget(),
};
