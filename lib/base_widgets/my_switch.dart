import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {

  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {

  bool active = false;

  Widget build(BuildContext context) {

    return Container(
      child: Switch(
        value: active,
        onChanged: (value) {
          setState(() {
            active = value;
          });
        },
      ),
    );
  }
}