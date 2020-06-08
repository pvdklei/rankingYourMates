import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/home_option.dart';
import 'package:ranking_your_mates/base_widgets/my_button.dart';

class BasicScreen extends StatelessWidget {

  final int color;
  final String title;
  final Icon icon;
  final List <Widget> bodychildren;
  final Function rightButtonAction;
  final bool leftButton;
  final bool rightButton;
  final bool bottomNav;
  
  BasicScreen({
    this.color,
    this.title,
    this.bodychildren,
    this.icon,
    this.rightButtonAction,
    this.leftButton: true,
    this.rightButton: true,
    this.bottomNav: true,
  });

  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: HomeOption(title, color, icon, '',),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bodychildren,
          ),
        ],
      ),
      bottomNavigationBar: bottomNav ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              leftButton ? MyButton(
                color, 
                Icon(Icons.arrow_back, size: 40.0,), 
                () => Navigator.pop(context),
              ) : Container(),
              rightButton ? MyButton(
                color, 
                Icon(Icons.done, size: 40.0,), 
                rightButtonAction,
              ) : Container(),
            ],
          ),
        ),
      ) : SizedBox(),
    );
  }
}