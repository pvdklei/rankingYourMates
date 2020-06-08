import 'package:flutter/material.dart';
import 'package:ranking_your_mates/screens/my_rankings/my_rankings_item.dart';

class MyRankingsDate extends StatelessWidget {

  final String date;
  final List <MyRankingsItem> rankings;

  MyRankingsDate({this.date, this.rankings});

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              letterSpacing: 3.0,
              fontWeight: FontWeight.w400,
            ),
          ), 
          Column(
            children: rankings
          ),
        ],
      ),
    );
  }
}