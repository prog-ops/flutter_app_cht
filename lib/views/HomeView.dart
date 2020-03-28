import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Future<DocumentSnapshot> getDocument() async{
    return Firestore.instance.document(
      '/users_data/bTNdkuuLgnui8hprgFNu'
    ).get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: getDocument(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Text('An error occured');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData){
                return Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                        snapshot.data['display_name'],
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                );
              }
            }
          },
        )),
    );
  }
}
