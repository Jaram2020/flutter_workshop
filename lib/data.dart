import 'package:cloud_firestore/cloud_firestore.dart';

QuerySnapshot getData() {
  final Firestore fs = Firestore.instance;
  fs.collection("schedule").getDocuments().then(
    (QuerySnapshot qss) {
      qss.documents.forEach((f) => print('${f.data}}'));
      return qss;
    },
  );
}
