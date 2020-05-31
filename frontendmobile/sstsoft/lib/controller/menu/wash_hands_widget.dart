import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WashHandsWidget extends StatefulWidget {
  @override
  _WashHandsWidgetState createState() => _WashHandsWidgetState();
}

class _WashHandsWidgetState extends State<WashHandsWidget> {
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
        title: Text("Lavado de manos"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: 'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}
