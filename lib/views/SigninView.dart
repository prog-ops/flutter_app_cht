import 'package:flutter/material.dart';
import 'package:flutter_app_cht/scaffold.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("signed in " + user.displayName);
    return user;
  }

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
                    onPressed:(){
                      _handleSignIn()
                          .then((FirebaseUser user) => print(user))
                          .catchError((e) => print(e));

                      return MyChatApp;

                        /*() async {
                      GoogleSignInAccount googlUser = await GoogleSignIn()
                      .signIn()
                      .timeout(Duration(seconds: 180));
                      final GoogleSignInAuthentication googlAuth =
                      await googlUser.authentication;*/
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
