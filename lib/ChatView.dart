import 'package:flutter/material.dart';
import 'package:flutter_app_dapur_grid/ChatMessages.dart';
import 'dart:convert';

import 'package:flutter_app_dapur_grid/Helper.dart';

class ChatView extends StatefulWidget {
  ChatView({
    Key key,
    this.friendName: "",
    this.lastMessage: "",
    this.avatarUrl,
    this.friendId
  }) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;
  final String avatarUrl;
  final String friendId;
}


class _ChatViewState extends State<ChatView> {
  String _friendInitial;
  TextEditingController _controller = TextEditingController();
  List<dynamic> _listOfMessages;


  @override
  void initState() {
    _listOfMessages = List();

    setState(() {
      _friendInitial = widget.friendName.substring(0,1);
    });
    super.initState();
  }


  void loadMessages(BuildContext context) async{
    Map<String, dynamic> tempObject = await loadJsonFileAsMap(context, 'assets/messageDetails.json');

    _listOfMessages = tempObject[widget.friendId]['messages'];
    print('_listOfMessages $_listOfMessages');
  }


  @override
  Widget build(BuildContext context) {
    loadMessages(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder(
              future: loadJsonFileAsMap(context, 'assets/messageDetails.json'),
              builder: (BuildContext context, AsyncSnapshot snapshot){

                if (snapshot.connectionState == ConnectionState.done) {

                  if (snapshot.hasData) {
                    int _index = 0;

                    Map<String, dynamic> tempMap = snapshot.data;
                    List<ChatMessages> chatMessageWidgets = List();

                    tempMap.forEach((_key, _value){
                      print('_value: $_value');

                      List<dynamic> _messageList = _value['messages'];
                      print('messagelist $_messageList');

                      _messageList.forEach((_message){
                        print('_message $_message');

                        chatMessageWidgets.add(
                            ChatMessages(
                              isFriend: true,
                              isNotPrevious: tempMap.length - 1 == _index,
                              message: _message['content'],
                              friendInitial: "J",
                              avatarUrl: _value['avatar'],
                            )
                        );
                        _index++;
                      });
                    });


                    /*List<dynamic> chatMessagesList = snapshot.data;
                    chatMessagesList.forEach((_message){
                      print('_message: $_message');
                      chatMessageWidgets.add(
                        ChatMessages(
                          isFriend: true,
                          isNotPrevious: chatMessagesList.length - 1 == _index,
                          message: _message['content'],
                          friendInitial: "J",
                        )
                      );
                      _index++;
                    });*/

                    return ListView(children: chatMessageWidgets,);

                  } else {
                    return Center(
                      child: Text('No messages found'),
                    );
                  }

                } else {
                  return CircularProgressIndicator();
                }
              },
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
