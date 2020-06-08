import 'package:flutter/material.dart';
import 'package:ranking_your_mates/screens/home_screen/home_options.dart';
import 'logo.dart';

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Logo(),
          HomeOptions(),
        ],
      )
    );
  }
}