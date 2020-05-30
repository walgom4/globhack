import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';

class EndJourneyWidget extends StatefulWidget {
  @override
  _EndJourneyWidgetState createState() => _EndJourneyWidgetState();
}

class _EndJourneyWidgetState extends State<EndJourneyWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
