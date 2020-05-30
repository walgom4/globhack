import 'package:flutter/material.dart';

class EndJourneyWidget extends StatefulWidget {
  @override
  _EndJourneyWidgetState createState() => _EndJourneyWidgetState();
}

class _EndJourneyWidgetState extends State<EndJourneyWidget> {
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
        title: Text("Fin de jornada"),
        backgroundColor: Colors.purple,
      ),
      body: Container(),
    );
  }
}