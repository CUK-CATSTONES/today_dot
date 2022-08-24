import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:today_dot/model/repository/diary_repository.dart';

import '../model/asset/status.dart';

class EditDiaryController extends GetxController {
  late DiaryVO? diary;
  RxList docIDs = [].obs;

  String date = '';
  String content = '';
  String emoji = '';

  late CollectionReference userData;

  Future addDiaryToDB(Map<String, dynamic> map) async {
    print('17');
    print(map['emoji']);
    print(map['content']);
    DiaryRepository diaryRepository = DiaryRepository();
    print('21');
    final documentReference =
        FirebaseFirestore.instance.collection('diary').doc();
    print('22');
    final uid = documentReference.id;
    print(uid);
    diaryRepository.addDiary(map['content'], map['emoji']).then((value) {
      print(value);
      switch (value) {
        case Status.error:
          print('저장에러');
          break;
        case Status.success:
          print('저장성공');
          Get.snackbar('저장 완료!', '오늘의 일기가 등록되었습니다.');
          Get.offAllNamed('/home');
          break;
      }
    });
  }

  Future readDiaryToDB() async {
    try {
      CollectionReference userDiary =
          FirebaseFirestore.instance.collection('diary');
      QuerySnapshot querySnapshots = await userDiary.get();
      for (var snapshot in querySnapshots.docs) {
        var documentID = snapshot.id;
        docIDs.add(documentID);
        print('documentID: $documentID');
        await userDiary.doc(documentID).get().then((DocumentSnapshot data) {
          var diaryContent = data['content'];
          content = diaryContent;
          print('diaryContent: $content');
          var diaryEmoji = data['emoji'];
          emoji = diaryEmoji;
          print('diaryEmoji: $emoji');
          var diaryDate = data['date'];
          date = diaryDate;
          print('diaryDate: $date');
          print('--');
          update();
        });
      }
    } catch (e) {
      print(e);
      return Status.error;
    }
    print('성공시');
    print('-----');
    print(docIDs);
    print(content);
    print(emoji);
    print(date);

    return Status.success;
  }
}
