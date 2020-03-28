import 'package:flutter/material.dart';
import 'package:flutter_app_cht/ChatHead.dart';
import 'package:flutter_app_cht/Helper.dart';
import 'package:flutter_app_cht/constants/constants.dart' as Constants;

class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
            future: loadJsonFileAsMap(context, 'assets/recentChats.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              List<ChatHead> templist = List();

              if (snapshot.connectionState == ConnectionState.done) {

                if (snapshot.hasData) {
                  Map<String, dynamic> tempMap = snapshot.data;
                  tempMap.forEach((_key, _value){
                    ///print('VALUE ${_value["display_name"]}');
                    print('VALUE ${_value[Constants.DISPLAY_NAME]}');
                    DateTime messageTime = DateTime.fromMillisecondsSinceEpoch(_value["last_message"]["timestamp"]);
                    templist.add(ChatHead(
                      friendName: _value["display_name"],
                      messageTime: messageTime,
                      lastMessage: _value["last_message"]["content"],
                      friendId: _key,
                      avatar: _value['avatar'],
                    ));
                  });

                  return ListView(children: templist);
                } else {
                  return Text('No chats found');
                }

              } else {
                return CircularProgressIndicator();
              }
            },
        )
      ),
    );
  }
}
