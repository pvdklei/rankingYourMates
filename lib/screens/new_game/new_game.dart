import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/base_widgets/text_form.dart';
import 'package:ranking_your_mates/firebase/firestore.dart';
import 'package:ranking_your_mates/tools/encrypt.dart';

class NewGame extends StatefulWidget {

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {

  String _sessionName;
  String _password;
  dynamic _sessionId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setSessionName(name) => _sessionName = name;
  void _setPassword(password) => _password = password;

  @override
  Widget build(BuildContext context) {

    final _user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: BasicScreen(
          title: 'New Game',
          color: 0xFFFA3C50,
          icon: Icon(Icons.add, size: 30.0,),
          rightButtonAction: () async {
            if (!_formKey.currentState.validate()) {
              return;
            }
            _formKey.currentState.save();
            dynamic _sessionId = await database.updateSession(
              name: _sessionName,
              password: encrypt(_password),
            );
            database.addSessionToUserData(
              uid: _user.uid,
              sessionId: _sessionId,
            );
            Navigator.pop(context);
          },
          bodychildren: <Widget>[
            TextForm(
              label: 'Session Name:',
              onSaved: _setSessionName,
              validator: (val) => val.isEmpty ? 'Fill in a session name' : null,
            ),
            TextForm(
              label: 'Password:',
              onSaved: _setPassword,
              validator: (val) => val.length < 2 ? 'At least two characters please' : null,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
