import 'package:flutter/material.dart';

class MyChatApp extends StatefulWidget {
  @override
  _MyChatAppState createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  int _currentIndeks = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: Center(child: Text("center")),
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
    );
  }
}
