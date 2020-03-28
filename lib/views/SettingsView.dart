import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Sign out'),
              onPressed: () async {
                try{
                  await GoogleSignIn().signOut();
                  await FirebaseAuth.instance.signOut();

                } on PlatformException catch(pe){
                  print('SIGNOUT PLATFORM ERR > ${pe.message}');

                } catch(e) {
                  print('SIGNOUT exception > ${e.toString()}');

                }
              },
            )
          ],
        ),
      ),
    );
  }
}
