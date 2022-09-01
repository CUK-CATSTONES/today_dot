import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  // void addDiaryUID(Map<String, dynamic> map) async {
  //   final documentReference =
  //       FirebaseFirestore.instance.collection('diary').doc();
  //   map.addAll({'uid': documentReference.id});
  //   diary = DiaryVO.fromMap(map);
  // }

  Future addDiary(String content, String emoji, String uid) async {
    Timestamp stamp = Timestamp.now();
    DateTime date = stamp.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd hh시 mm분', 'ko').format(date);
    try {
      // Map<String, dynamic>? map = diary?.toJson();
      // user
      print('37');
      CollectionReference userDiary = FirebaseFirestore.instance
          .collection(collection1)
          .doc(uid)
          .collection(collection2);
      var userID = userDiary.doc().id;
      print('diary doc id: $userID');
      print('40');
      await userDiary.doc(userID).set({
        'date': formattedDate,
        'content': content,
        'emoji': emoji,
        'uid': uid,
        'docID': userID
      });
      print('1: $content');
      print('2: $emoji');
      print('3: $uid');
      print('4: $docID');

      // await userDiary
      //     .add({'date': formattedDate, 'content': content, 'emoji': emoji});
    } catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  Future deleteDiary(String id) async {
    try {
      print('70');
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
      print('diary repo read 실행중');
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
        print(docIDs);
        print(docIDs.length);
      });
    } catch (e) {
      print(e);
      return Status.error;
    }

    // diary = DiaryVO.fromMap(document as Map<String, dynamic>);
    return Status.success;

    // QuerySnapshot querySnapshots = await userDiary.get();
    // for (var snapshot in querySnapshots.docs) {
    //   var documentID = snapshot.id;
    //   await userDiary.doc(documentID).get().then((DocumentSnapshot data) {
    //     var diaryContent = data['content'];
    //     print('diaryContent: $diaryContent');
    //     var diaryEmoji = data['emoji'];
    //     print('diaryEmoji: $diaryEmoji');
    //     var diaryDate = data['date'];
    //     print('diaryDate: $diaryDate');
    //   });

    // final messages = snapshot.data.docs;
    // for (var message in messages) {
    //   final messageText = message.get('text');
    //   final messageSender = message.get('sender');

    //   final messageBubble =
    //       MessageBubble(text: messageText, sender: messageSender);
    //   messageBubbles.add(messageBubble);
    // }
    // }
  }
}
