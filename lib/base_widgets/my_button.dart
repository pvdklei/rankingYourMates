import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final int color;
  final Icon icon;
  final Function action;
  
  MyButton(this.color, this.icon, this.action);

  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: icon,
          ),
        ),
      )
    );
  }
}