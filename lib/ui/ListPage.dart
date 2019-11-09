import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sightwords/pages/QuizPage.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
    
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('words')
              .snapshots(),
            builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          return GestureDetector(
                            onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => QuizPage()),
                                 );
                            },
                            child: Text(document.data['word'], style: TextStyle(fontSize: 20)),
                          );
                      }).toList(),
                    );
                }
              },
            ),
          );
  }
}