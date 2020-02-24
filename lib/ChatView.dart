import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatMessages.dart';

class ChatView extends StatefulWidget {
  ChatView({
    Key key,
    this.friendName,
    this.lastMessage
  }) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;
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
          ChatMessages(isFriend: true, isNotPrevious: true,),
          ChatMessages(isFriend: false, isNotPrevious: true,)
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
