import 'package:flutter/material.dart';

class MyRankingsItem extends StatelessWidget {

  final String title;

  MyRankingsItem(this.title);

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFFC6C8C),
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 5.0,
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}