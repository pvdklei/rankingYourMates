import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/home_option.dart';

class HomeOptions extends StatelessWidget {

  final List <Widget> options = [
    HomeOption('New Game', 0xFFFA3C50, Icon(Icons.add, size: 30.0,), '/new_game'),
    HomeOption('Join Session', 0xFFBAF1E4, Icon(Icons.search), '/join_session'),
    HomeOption('My Rankings', 0xFFFC6C8C, Icon(Icons.menu), '/my_rankings'),
    HomeOption('Settings', 0xFF48B9A8, Icon(Icons.settings), '/settings'),
  ];

  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: options,
    );
  }
}