import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sstsoft/cons/general_cons.dart';

import 'clipper.dart';

///Shell login implementation
///Based on: https://github.com/TheAlphamerc/flutter_login_signup
class BezierWidget extends StatelessWidget {
  const BezierWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height *.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: GeneralCons.degradeColor
              )
            ),
        ),
      ),
      )
    );
  }
}