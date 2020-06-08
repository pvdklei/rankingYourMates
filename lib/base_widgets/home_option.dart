import 'package:flutter/material.dart';

class HomeOption extends StatelessWidget {

  final String text;
  final int color;
  final Icon icon;
  final String destination;

  HomeOption(this.text, this.color, this.icon, this.destination);

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, destination),
            child: Container(
              width: 300.0,
              height: 58.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(color),
                  width: 2.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(55.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0),
                    child: Container(
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Color(color),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: icon,
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            )
          ),
        ]
      ),
    );
  }
}