import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_your_mates/screens/auth.dart/sign_up.dart';
import 'package:ranking_your_mates/screens/join_session/join_session.dart';
import 'package:ranking_your_mates/screens/my_rankings/my_rankings.dart';
import 'package:ranking_your_mates/screens/new_game/new_game.dart';
import 'package:ranking_your_mates/screens/settings/settings.dart';
import 'package:ranking_your_mates/splash_screen.dart';
import 'base_widgets/loading.dart';
import 'firebase/auth.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  Widget build(BuildContext context) {

    return StreamProvider<FirebaseUser>.value(
      value: auth.user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/sign_up': (context) => SignUp(),
          '/loading': (context) => Loading(),
          '/home_screen': (context) => HomeScreen(),
          '/new_game': (context) => NewGame(),
          '/join_session': (context) => JoinSession(),
          '/my_rankings': (context) => MyRankings(),
          '/settings': (context) => Settings(),
        },  
      ),
    );
  }
}