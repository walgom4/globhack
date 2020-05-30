import 'package:flutter/material.dart';

class InformationWidget extends StatefulWidget {
  @override
  _InformationWidgetState createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
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
        title: Text("Información"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(),
    );
  }
}
