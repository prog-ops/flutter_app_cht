import 'package:flutter/material.dart';
import 'package:flutter_app_cht/views/ChatHistory.dart';
import 'package:flutter_app_cht/views/HomeView.dart';
import 'package:flutter_app_cht/views/SettingsView.dart';
import 'package:flutter_app_cht/views/SigninView.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyChatApp extends StatefulWidget {
  @override
  _MyChatAppState createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  int _currentIndeks = 0;

  bool isSignedIn = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    /// LISTEN TO AUTH CHANGES
    _auth.onAuthStateChanged.listen((_user) {
      print('AUTH STATE CHANGED > $_user');

      if (_user != null) {
        /// USER HAS SIGNED IN
        setState(() {
          isSignedIn = true;
        });

      } else {
        /// USER HAS SIGNED OUT
        setState(() {
          /// THE USER IS NULL
          isSignedIn = false;
        });

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: !isSignedIn
          ? SigninView()
          : Scaffold(
              appBar: AppBar(
                title: Text("Chatta"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                      print("Button pressed");
                    },
                  ),
                ],
              ),
              body: selectedScreen(_currentIndeks),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndeks,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text("Home")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), title: Text("Chats")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), title: Text("Settings")),
                ],
                onTap: (int indeks) {
                  print("indeks is " + indeks.toString());
                  setState(() {
                    _currentIndeks = indeks;
                  });
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  print("FAB pressed");
                },
                child: Icon(Icons.add),
              ),
            ),

//      home: ChatView(),
    );
  }

  Widget selectedScreen(int _indeks) {
    switch (_indeks) {
      case 0:
        return HomeView();
        break;
      case 1:
        return ChatHistory();
        break;
      case 2:
        return SettingsView();
        break;
      default:
        // return HomeView();
        return ChatHistory();
    }
  }
}
