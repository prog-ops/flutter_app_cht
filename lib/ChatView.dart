import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatMessages.dart';
import 'dart:convert';

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
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    setState(() {
      _friendInitial = widget.friendName.substring(0,1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadMessageDetails();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder(

            )
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                      controller: _controller,
                      onFieldSubmitted: (String _message) {
                        print("on field submitted >> " +_message);
                      },
                      decoration: InputDecoration(
                          hintText: "Type your message",
                          labelText: "Your message",
                          helperText: "Here's where the message goes"
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          print("send message tapped >> " + _controller.text);
                        }),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Future<List> loadMessageDetails() async {
    String messageDetailsString = await DefaultAssetBundle.of(context)
        .loadString('assets/messageDetails.json');
//    print("message detail: $messageDetailsString");

    Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
//    print('mappedMessages $mappedMessages');
//    print('12345 ${mappedMessages['12345']}');

    List<dynamic> messages = mappedMessages['12345']['messages'];
    print('list $messages');
    /*messages.forEach((_value){
      print('value is $_value');
    });*/
    return messages;
  }

  List<Widget> getMessages(){
    List<Widget> tempList = List();

    loadMessageDetails().then((_value){

      tempList.add(Text('No messages around'));

      if(_value != null) {

      } else {

      }
    });
    return tempList;
  }
}
