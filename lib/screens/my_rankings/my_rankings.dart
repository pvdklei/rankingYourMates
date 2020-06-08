import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/screens/my_rankings/my_rankings_date.dart';
import 'package:ranking_your_mates/screens/my_rankings/my_rankings_item.dart';

class MyRankings extends StatelessWidget {

  Widget build(BuildContext context) {

    return BasicScreen(
      color: 0xFFFC6C8C,
      title: 'My Rankings',
      icon: Icon(Icons.menu),
      bodychildren: <Widget>[
        MyRankingsDate(
          date: 'Current',
          rankings: <MyRankingsItem>[
            MyRankingsItem('Ranking de mannen'),
            MyRankingsItem('Ff paus denk'),
          ], 
        ),
        MyRankingsDate(
          date: '20 dec 2020',
          rankings: <MyRankingsItem>[
            MyRankingsItem('Rot maar op hoer')
          ],
        )
      ],
    );
  }
}