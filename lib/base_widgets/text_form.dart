import 'package:flutter/material.dart';
import 'package:ranking_your_mates/constants/style.dart';

class TextForm extends StatefulWidget {

  final String label;
  final Function onSaved;
  final bool obscureText;
  final Function validator;
  
  TextForm({this.label, this.onSaved, this.validator, this.obscureText: false});

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 20.0),
          child: Text(
            widget.label,
            style: bodyStyle1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
          child: Container(
            width: 300.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 20.0, 3.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
                onSaved: widget.onSaved,
                obscureText: widget.obscureText,
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 3.0
                ),
                validator: widget.validator,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
