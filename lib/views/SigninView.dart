import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(child: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Card(
            color: Colors.blue[100],
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Sign in to Chatta',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 40.0,),
                  RaisedButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Sign In with Google'),
                    onPressed: () async {
                      GoogleSignInAccount googlUser = await GoogleSignIn()
                      .signIn()
                      .timeout(Duration(seconds: 180));
                      final GoogleSignInAuthentication googlAuth =
                      await googlUser.authentication;

                    },
                  ),
                  SizedBox(height: 40.0,),
                  Text(
                    'By signing in you agree to Terms',
                    style: Theme.of(context).textTheme.body2,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
