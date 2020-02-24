import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();

  // whether the message comes the friend
  final bool isFriend;
  // the friend's initial to show in the avatar
  final String friendInitial;
  // whether the message is last or not
  final bool isNotPrevious;
  // the actual message
  final String message;

  ChatMessages({
    Key key,
    this.isFriend: false,
    this.isNotPrevious: false,
    this.message: "",
    this.friendInitial: "",
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
            child: Text(widget.friendInitial),
          ) : Container(),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(widget.message)
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
