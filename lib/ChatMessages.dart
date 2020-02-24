import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();

  final bool isFriend;
  final bool isNotPrevious;

  final String message;

  ChatMessages({
    Key key,
    this.isFriend: false,
    this.isNotPrevious: false,
    this.message
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
          widget.isFriend && widget.isNotPrevious ?
          CircleAvatar(
            radius: 32,//34
            backgroundColor: Colors.white,
            child: Text("Friend"),
          ) : Container(),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("chat here")
              ),
          ),

          !widget.isFriend && widget.isNotPrevious ?
          CircleAvatar(
            radius: 32,//34
            backgroundColor: Colors.white,
            child: Text("Me"),
          ) : Container(),
        ],
      ),
    );
  }
}
