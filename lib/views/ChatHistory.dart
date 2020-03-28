import 'package:flutter/material.dart';
import 'package:flutter_app_cht/ChatHead.dart';
import 'package:flutter_app_cht/ChatMessages.dart';
import 'package:flutter_app_cht/Helper.dart';
import 'package:flutter_app_cht/constants/constants.dart' as Constants;
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('/message_data/friendA##friendB/message_list')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError)
              return Text('An error occured ${snapshot.error.toString()}');

            if (snapshot.connectionState == ConnectionState.active) {

              if (snapshot.hasData) {

                return ListView.builder(

                  itemBuilder: (BuildContext context, int indeks){
                    DocumentSnapshot _data = snapshot.data.documents[indeks];
                    print('DATA > ${_data['content']}');

                    return ChatMessages(
                      isFriend: _data['fromA'],
                      isNotPrevious: true,
                      message: _data['content'],
                      avatarUrl: 'https://avatarfiles.alphacoders.com/132/132399.jpg',
                      friendInitial: 'T',///todo change to dynamic from contacts
                    );
                  },
//                itemCount: snapshot.data,
                );
              } else {
                return Text(Constants.NO_MESSAGE_FOUND+'\nSend one now');
              }

            } else {
              return CircularProgressIndicator();
            }

          },
        )

          /// todo cleanup later
        /*FutureBuilder(
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
        )*/
      ),
    );
  }
}
