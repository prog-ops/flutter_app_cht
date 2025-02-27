import 'package:flutter/material.dart';
import 'package:flutter_app_cht/ChatMessages.dart';
import 'dart:convert';

import 'package:flutter_app_cht/Helper.dart';

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

  String avatarUrl = "";

  FocusNode focusChatMessage;

  @override
  void initState() {
    _listOfMessages = List();
    focusChatMessage = FocusNode();
    setState(() {
      _friendInitial = widget.friendName.substring(0,1);
    });

    super.initState();

    loadMessages(context);
  }

  @override
  void dispose() {
    focusChatMessage.dispose();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void loadMessages(BuildContext context) async{
    Map<String, dynamic> tempObject = await loadJsonFileAsMap(context, 'assets/messageDetails.json');

    setState(() {
      _listOfMessages = tempObject[widget.friendId]['messages'];
      avatarUrl = tempObject[widget.friendId]['avatar'];
    });

    print('_listOfMessages $_listOfMessages');
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
            child: ListView.builder(
                itemCount: _listOfMessages.length,
                itemBuilder: (BuildContext context, int indeks){
                  Map<String, dynamic> _tempMesssage = _listOfMessages[indeks];
                  print('_tempMesssage $_tempMesssage');

                  return ChatMessages(
                    isFriend: true,
                    isNotPrevious: _listOfMessages.length - 1 == indeks,
                    message: _tempMesssage['content'],
                    friendInitial: _tempMesssage['display_name'].toString().substring(0,1),
                    avatarUrl: avatarUrl,
                  );
                },
            )
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(focusChatMessage);
                        }),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    focusNode: focusChatMessage,
                    onFieldSubmitted: (String _message) {
                      submitText();
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: "Type here",
                        // labelText: "Your message",
                        // helperText: "Here's where the message goes"
                    ),
                  )
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  /// submits the text in the text field and then clear it
  void submitText(){
    print("on field submitted >> " +_controller.text);

    if(_controller.text.length > 0) {
      // todo create a new message object containing the text from the field
      Map<String, dynamic> newMessage = {
        "type": "string",
        "content": _controller.value.text,
        "from": "me",
      };
      
      try{
        // todo add the new message object to the list
      _listOfMessages.add(newMessage);
      
      // todo clear the text
      _controller.clear();
      } catch (e){
        print('CHAT VIEW > ERR > ${e.toString()}');
      }
    }
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
