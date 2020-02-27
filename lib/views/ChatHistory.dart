import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatHead.dart';
import 'package:flutter_app_dapur_grid/Helper.dart';

class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            ChatHead(
              friendName: "Tha", lastMessage: "I do the snap", messageTime: DateTime.now(),
            ),
            ChatHead(
              friendName: "Capn", lastMessage: "Please tell Tha", messageTime: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
