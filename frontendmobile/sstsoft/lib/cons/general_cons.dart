import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GeneralCons {
  ///General color for UX
  static final baseColor = Color(0xff800080);
  static final whiteColor = Colors.white;
  static final secondaryColor = Color(0xffe46b10);

  ///General degrade color for UX
  static final degradeColor = [baseColor, secondaryColor];

  ///Splash degrade color for UX
  static final splashDegradeColor = [whiteColor, secondaryColor];

  ///Initial date for all datepickers
  static final DateTime generalInitialDate = DateTime(1900);

  ///General text style
  static final TextStyle generalTextStyle = TextStyle(fontSize: 15);

  ///Title text style
  static final TextStyle titleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  ///General date format
  static final DateFormat generalDateFormat = DateFormat('yyyy-MM-dd');
}
