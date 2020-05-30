import 'package:flutter/material.dart';

class StartJourneyWidget extends StatefulWidget {
  @override
  _StartJourneyWidgetState createState() => _StartJourneyWidgetState();
}

class _StartJourneyWidgetState extends State<StartJourneyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Inicio de jornada"),
        backgroundColor: Colors.purple,
      ),
      body: Container(),
    );
  }
}