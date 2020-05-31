import 'package:flutter/material.dart';

class FeelingBadWidget extends StatefulWidget {
  @override
  _FeelingBadWidgetState createState() => _FeelingBadWidgetState();
}

class _FeelingBadWidgetState extends State<FeelingBadWidget> {
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
        title: Text("Me siento mal"),
        backgroundColor: Colors.red,
      ),
      body: Container(),
    );
  }
}