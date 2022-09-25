import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:intl/intl.dart';
import 'package:today_dot/model/VO/user_vo.dart';

import '../asset/status.dart';
import 'dart:io';

class DiaryRepository {
  // final auth = FirebaseAuth.instance;
  List<String> docIDs = [];
  String date = '';
  String content = '';
  String emoji = '';
  String uid = '';
  String docID = '';
  // late String data;

  DiaryRepository();

  DiaryVO? diary;
  UserVO? user;
  String collection1 = 'user';
  String collection2 = 'diary';

  final String defaultLocale = Platform.localeName;

  Future addDiary(String content, String emoji, String uid) async {
    Timestamp stamp = Timestamp.now();
    DateTime date = stamp.toDate();
    String formattedDate = DateFormat('d MMM, yyyy a hh:mm').format(date);
    try {
      CollectionReference userDiary = FirebaseFirestore.instance
          .collection(collection1)
          .doc(uid)
          .collection(collection2);
      var userID = userDiary.doc().id;
      await userDiary.doc(userID).set({
        'date': formattedDate,
        'content': content,
        'emoji': emoji,
        'uid': uid,
        'docID': userID
      });
    } catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  Future deleteDiary(String id) async {
    try {
      CollectionReference userDiary = FirebaseFirestore.instance
          .collection(collection1)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(collection2);
      print('userDiary: $userDiary');
      await userDiary.doc(id).delete();
    } catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  Future readDiary() async {
    DocumentSnapshot document;
    try {
      CollectionReference userDiary = FirebaseFirestore.instance
          .collection(collection1)
          .doc(uid)
          .collection(collection2);
      userDiary.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          final document = doc.data();
          print('document: $document');
          final content = doc.get('content');
          final date = doc.get('date');
          final emoji = doc.get('emoji');
          docIDs.add(doc.reference.id);
        }
      });
    } catch (e) {
      print(e);
      return Status.error;
    }

    return Status.success;
  }
}
