import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatMessages.dart';

class ChatView extends StatefulWidget {
  ChatView({
    Key key,
    this.friendName: "",
    this.lastMessage: ""
  }) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;
}

class _ChatViewState extends State<ChatView> {
  String _friendInitial;

  @override
  void initState() {
    setState(() {
      _friendInitial = widget.friendName.substring(0,1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                ChatMessages(
                  isFriend: true,
                  isNotPrevious: true,
                  friendInitial: _friendInitial,
                  message: "I really want to be a pilot",
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: TextFormField()),
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          print("send message tapped");
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
