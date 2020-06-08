import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/base_widgets/text_form.dart';
import 'package:ranking_your_mates/constants/style.dart';
import 'package:ranking_your_mates/firebase/auth.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _name;
  String _password;
  String _repeatPassword;
  String _email;
  bool _invalid = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BasicScreen(
        color: 0xff606060,
        title: 'Sign Up',
        rightButtonAction: () async {
          _formKey.currentState.save();

          if (_password != _repeatPassword) {
            setState(() => _invalid = true);
            return;
          }

          dynamic user = auth.registerEmail(
            email: _email,
            password: _password,
          );
          if (user == null) {
            setState(() => _invalid = true);
            return;
          } else {
            Navigator.pushNamed(context, '/home_screen');
          }
        },
        icon: Icon(Icons.account_circle, color: Colors.white,),
        bodychildren: [
          TextForm(
            label: 'Name:',
            onSaved: (val) => _name = val,
          ),
          TextForm(
            label: 'Email:',
            onSaved: (val) => _email = val,
          ),
          TextForm(
            label: 'Password:',
            obscureText: true,
            onSaved: (val) => _password = val,
          ),
          TextForm(
            label: 'Repeat Password:',
            obscureText: true,
            onSaved: (val) => _repeatPassword = val,
          ),
          _invalid ? Center(
            child: Text('Something went wrong...', style: errorStyle,),
          ) : SizedBox(),
          SizedBox(height: 60.0)
        ],
      ),
    );
  }
}