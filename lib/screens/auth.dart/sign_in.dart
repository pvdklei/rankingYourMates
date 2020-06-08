import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:ranking_your_mates/base_widgets/basic_screen.dart';
import 'package:ranking_your_mates/base_widgets/loading.dart';
import 'package:ranking_your_mates/base_widgets/text_form.dart';
import 'package:ranking_your_mates/constants/style.dart';
import 'package:ranking_your_mates/firebase/auth.dart';
import 'package:ranking_your_mates/screens/auth.dart/auth_option.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  InterstitialAd interstitialAd;
  String _email;
  String _password;
  bool _validCred = true;
  bool _loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          interstitialAd = buildInterstitialAd()..load();
        }
        print(event);
      },
    );
  }

  void showInterstitialAd() {
    interstitialAd..show();
  }

  @override
  void initState() {
    super.initState();
    interstitialAd = buildInterstitialAd()..load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      color: 0xff606060,
      title: 'Sign In',
      icon: Icon(Icons.account_circle, color: Colors.white,),
      bodychildren: [
        Form(
          key: _formKey,
          child: ExpandableAuthOption(
            color: 0xffe0e0e0,
            title: 'Email and Password',
            children: [
              TextForm(
                label: 'Email:',
                onSaved: (val) => _email = val,
              ),
              TextForm(
                label: 'Password:',
                obscureText: true,
                onSaved: (val) => _password = val,
              ),
              !_validCred ? Text(
                'Invalid credentials', 
                style: errorStyle
              ) : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showInterstitialAd();
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: Container(
                        width: 70.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 10.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _loading ? Loading() : SizedBox(),
                    GestureDetector(
                      onTap: () async {
                        setState(() => _loading = true);
                        _formKey.currentState.save();
                          
                        // sign in 
                        dynamic user = await auth.signInEmail(
                          email: _email, 
                          password: _password
                        );
                        
                        if (user == null) {
                          setState(() => _validCred = false);
                        }
                        setState(() => _loading = false);
                      },
                      child: Container(
                        width: 50.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 10.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ExpandableAuthOption(
          color: 0xaaea4335,
          title: 'With Google',
          children: [

          ],
        ),
        ExpandableAuthOption(
          color: 0xaa3b5998,
          title: 'With Facebook',
          children: [

          ],
        )
      ],
      rightButtonAction: () {},
      bottomNav: false,
    );
  }
}