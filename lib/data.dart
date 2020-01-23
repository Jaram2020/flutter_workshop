import 'package:cloud_firestore/cloud_firestore.dart';

List getData(){
  final Firestore fs = Firestore.instance;
  var qls = [];
  var ls = [];
  fs.collection("schedule").getDocuments().then((QuerySnapshot qss) {
    for(var i = 0; i < qss.documents.length; i++){
      ls = [qss.documents[i]["date"], qss.documents[i]["topic"]];
      qls.addAll(ls);
    }
  });
  return qls;
}