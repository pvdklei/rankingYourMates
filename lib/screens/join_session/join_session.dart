import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/base_widgets/text_form.dart';

class JoinSession extends StatefulWidget {

  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {

  String _sessionName;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void setSessionName(name) => _sessionName = name;
  void setPassword(password) => _password = password;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _formKey,
        child: BasicScreen(
          title: 'Join Session',
          color: 0xFFBAF1E4,
          icon: Icon(Icons.search),
          bodychildren: <Widget>[
            TextForm(
              label: 'Session Name:',
              onSaved: setSessionName,
            ),
            TextForm(
              label: 'Password:',
              onSaved: setPassword,
            ),
          ],
        ),
      )
    );
  }
}
