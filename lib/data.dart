import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Data {
  Card newCard(String date, String name, String dis) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        title: Text(
          '$date $name',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        subtitle: Text(
          '$dis',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  List getData() {
    List<Card> list = [];
    final Firestore fs = Firestore.instance;
    fs.collection("schedule").getDocuments().then(
      (QuerySnapshot qss) {
        for (var i = 0; i < qss.documents.length; i++) {
          list.add(
            newCard(qss.documents[i]["date"], qss.documents[i]["name"],
                qss.documents[i]["des"]),
          );
        }
      },
    );
    return list;
  }
}
