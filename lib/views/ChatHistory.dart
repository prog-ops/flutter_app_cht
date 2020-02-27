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

    //Map<String, dynamic> mapOfChats = loadJsonFileAsMap(context, 'assets/recentChats.json');


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
                    print('VALUE ${_value["display_name"]}');
                    templist.add(ChatHead(
                      friendName: _value["display_name"],
                    ));
                  });

                  return ListView(children: templist,);
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
