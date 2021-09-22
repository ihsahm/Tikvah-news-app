import 'package:cloud_firestore/cloud_firestore.dart';

class NewsData {
  getData() async {
    return FirebaseFirestore.instance.collection('newslist').snapshots();
  }

  getSportData() async {
    return FirebaseFirestore.instance.collection('sportlist').snapshots();
  }

  getNewsData() async {
    return FirebaseFirestore.instance.collection('commonnews').snapshots();
  }
}
