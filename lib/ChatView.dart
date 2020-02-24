import 'package:flutter/material.dart';

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
