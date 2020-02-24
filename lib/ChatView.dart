import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatMessages.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend's name"),
      ),
      body: ListView(
        children: <Widget>[
          ChatMessages(isFriend: false,)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(child: Text("text here")),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: (){
              print("send message tapped");
            }),
          ],
        ),
      ),
    );
  }
}
