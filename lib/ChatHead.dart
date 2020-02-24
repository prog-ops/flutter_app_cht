import 'package:flutter/material.dart';

class ChatHead extends StatefulWidget {
  @override
  _ChatHeadState createState() => _ChatHeadState();

  /**
   * ! warning
   * * highlight
   * ? question
   * todo variables
   * fixme others
   *
   */

  // this is friend name
  final String friendName;

  // this is text that will appear below the name
  final String lastMessage;

  // date time when message was sent
  final DateTime messageTime;

  ChatHead({
    Key key,
    this.friendName: "",
    this.lastMessage: "",
    this.messageTime
  }) : super(key: key);
}

class _ChatHeadState extends State<ChatHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: double.infinity,
      height: 100,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.friendName,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  widget.lastMessage,
                  style: Theme.of(context).textTheme.body2,
                ),
                Text(widget.messageTime.toString()),
              ],
            ),
          ),
          CircleAvatar(
            radius: 32.0,
            child: Text(
              widget.friendName.substring(0,1),
              style: Theme.of(context).textTheme.display1.apply(
                color: Colors.white, fontWeightDelta: 3
              ),
            ),
          ),
        ],
      ),
    );
  }
}
