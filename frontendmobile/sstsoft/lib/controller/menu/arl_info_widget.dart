import 'package:flutter/material.dart';

class ArlInfoWidget extends StatefulWidget {
  @override
  _ArlInfoWidgetState createState() => _ArlInfoWidgetState();
}

class _ArlInfoWidgetState extends State<ArlInfoWidget> {
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
        title: Text("ARL"),
        backgroundColor: Colors.orange,
      ),
      body: Container(),
    );
  }
}
