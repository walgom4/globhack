import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class WashHandsWidget extends StatefulWidget {
  @override
  _WashHandsWidgetState createState() => _WashHandsWidgetState();
}

class _WashHandsWidgetState extends State<WashHandsWidget> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
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
          child: FlutterYoutube.playYoutubeVideoByUrl(
          apiKey: "AIzaSyDCHLiZpHDutMsmY0E8r9HHBc-CNDJdg-I",
          videoUrl: "https://www.youtube.com/watch?v=NMmAj1EKdVo",
          autoPlay: true, //default falase
          fullScreen: false, //default false
          appBarColor: Colors.blue
        )
      ),
    );
  }
}
