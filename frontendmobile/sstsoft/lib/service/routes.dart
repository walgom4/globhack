import 'package:flutter/material.dart';
import 'package:sstsoft/controller/forgot_password_widget.dart';
import 'package:sstsoft/controller/principal_widget.dart';

final routes = <String, WidgetBuilder>{
  PrincipalWidget.name: (context) => PrincipalWidget(),
  ForgotPasswordWidget.name: (context) => ForgotPasswordWidget(),
};