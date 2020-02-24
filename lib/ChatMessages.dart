import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();

  final bool isFriend;

  ChatMessages({
    Key key,
    this.isFriend: false,
  }) : super(key:key);
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 100,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.isFriend ?
          CircleAvatar(
            radius: 32,//34
            backgroundColor: Colors.white,
          ) : Container(),
          Expanded(child: Text("chat here")),

          widget.isFriend == false ?
          CircleAvatar(
            radius: 32,//34
            backgroundColor: Colors.white,
          ) : Container(),
        ],
      ),
    );
  }
}
