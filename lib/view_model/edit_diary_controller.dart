import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:today_dot/model/repository/edit_diary_repository.dart';

import '../model/asset/status.dart';

class EditDiaryController extends GetxController {
  late DiaryVO? diary;

  late String date;
  late String content;
  late String emoji;
  
  Future addDiaryToDB(Map<String, dynamic> map) async {
    print('17');
    print(map['emoji']);
    print(map['content']);
    DiaryRepository diaryRepository = DiaryRepository();
    print('21');
    final documentReference = FirebaseFirestore.instance.collection('diary').doc();
    print('22');
    final uid = documentReference.id;
    print(uid);
    diaryRepository.addDiary(map['content'], map['emoji']).then((value){
      print(value);
      switch (value) {
        case Status.error:
          print('저장에러');
          break;
        case Status.success:
          print('저장성공');
          break;
      }
    });
}

Future readDiaryToDB() async{
    DiaryRepository diaryRepository = DiaryRepository();
    final documentReference = FirebaseFirestore.instance.collection('diary').doc();
    final uid = documentReference.id;
    diaryRepository.readDiary(uid).then((value){
      switch(value){
        case Status.error:
          print(value);
      }
    });


}
}
