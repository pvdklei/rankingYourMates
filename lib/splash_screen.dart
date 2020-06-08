import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_your_mates/screens/auth.dart/sign_in.dart';
import 'package:ranking_your_mates/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      final user = Provider.of<FirebaseUser>(context);
      return user == null ? SignIn() : HomeScreen();
  }
}