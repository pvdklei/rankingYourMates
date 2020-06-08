import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/base_widgets/text_form.dart';
import 'package:ranking_your_mates/constants/style.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String _userName;
  String _bio;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setUserName(name) => _userName = name;
  void _setBio(bio) => _bio = bio;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: BasicScreen(
        color: 0xFF48B9A8,
        icon: Icon(Icons.settings),
        title: 'Settings',
        bodychildren: <Widget>[
          TextForm(
            label: 'Username:',
            onSaved: _setUserName,
          ),
          TextForm(
            label: 'Bio:',
            onSaved: _setBio,
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Center(
                    child: Container(
                      width: 120.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text('Sign Out', style: bodyStyle1,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
