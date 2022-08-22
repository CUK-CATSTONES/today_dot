import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:today_dot/model/repository/auth_repository.dart';
import 'package:intl/intl.dart';

import '../asset/status.dart';

class DiaryRepository {
  final auth = FirebaseAuth.instance;
  late String date;
  late String content;
  late String emoji;

  DiaryRepository();

  DiaryVO? diary;
  String collection = 'diary';

  void addDiaryUID(Map<String, dynamic> map) async{
    final documentReference = FirebaseFirestore.instance.collection('diary').doc();
    map.addAll({'uid': documentReference.id});
    diary = DiaryVO.fromMap(map);
  }

  Future addDiary(String content, String emoji) async{
    Timestamp stamp = Timestamp.now();
    DateTime date = stamp.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    try{
      Map<String, dynamic>? map = diary?.toJson();
      CollectionReference userDiary = FirebaseFirestore.instance.collection(collection);
      await userDiary.add({'date': formattedDate, 'content':content, 'emoji':emoji});
    } on FirebaseAuthException catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  Future readDiary(String date) async{

  }

}
