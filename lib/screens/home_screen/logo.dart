import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ranking',
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w300,
                      fontSize: 40.0,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'your ',
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.0,
                    ),
                  ),
                  Text(
                    'Mates',
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}