import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:intl/intl.dart';

import '../asset/status.dart';

class DiaryRepository {
  // final auth = FirebaseAuth.instance;
  List<String> docIDs = [];
  String date = '';
  String content = '';
  String emoji = '';
  // late String data;

  DiaryRepository();

  DiaryVO? diary;
  String collection = 'diary';

  // void addDiaryUID(Map<String, dynamic> map) async {
  //   final documentReference =
  //       FirebaseFirestore.instance.collection('diary').doc();
  //   map.addAll({'uid': documentReference.id});
  //   diary = DiaryVO.fromMap(map);
  // }

  Future addDiary(String content, String emoji) async {
    Timestamp stamp = Timestamp.now();
    DateTime date = stamp.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    try {
      // Map<String, dynamic>? map = diary?.toJson();
      CollectionReference userDiary =
          FirebaseFirestore.instance.collection(collection);
      await userDiary
          .add({'date': formattedDate, 'content': content, 'emoji': emoji});
    } catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  Future readDiary() async {
    DocumentSnapshot document;
    try {
      CollectionReference userDiary =
          FirebaseFirestore.instance.collection(collection);
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
