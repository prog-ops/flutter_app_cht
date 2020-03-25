import 'package:flutter/material.dart';
import 'package:flutter_app_cht/ChatHead.dart';
import 'package:flutter_app_cht/ChatView.dart';
import 'package:flutter_app_cht/views/ChatHistory.dart';
import 'package:flutter_app_cht/views/HomeView.dart';
import 'package:flutter_app_cht/views/SettingsView.dart';
import 'package:flutter_app_cht/views/SigninView.dart';

class MyChatApp extends StatefulWidget {
  @override
  _MyChatAppState createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  int _currentIndeks = 0;

  bool isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return !isSignedIn
      ? SigninView()
      : MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My chatapp"),
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
              icon: Icon(Icons.home), title: Text("Home")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), title: Text("Chats")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")
            ),
          ],
          onTap: (int indeks) {
            print("indeks is " +indeks.toString());
            setState(() {
              _currentIndeks = indeks;
            });
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("FAB pressed");

          },
          child: Icon(Icons.add),
        ),
      ),

//      home: ChatView(),
    );
  }

  Widget selectedScreen(int _indeks){
    switch(_indeks) {
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
