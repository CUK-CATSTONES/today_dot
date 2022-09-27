import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/VO/diary_vo.dart';
import 'package:today_dot/model/VO/user_vo.dart';
import 'package:today_dot/model/repository/diary_repository.dart';

import '../model/asset/status.dart';

class EditDiaryController extends GetxController {
  late DiaryVO? diary;

  RxList docIDs = [].obs;

  String date = '';
  String content = '';
  String emoji = '';
  String uid = '';
  late UserVO? user;

  String collection1 = 'user';
  String collection2 = 'diary';

  late CollectionReference userData;

  Future addDiaryToDB(Map<String, dynamic> map) async {
    DiaryRepository diaryRepository = DiaryRepository();
    map.addAll({'uid': FirebaseAuth.instance.currentUser!.uid});
    print('map::: $map');
    diaryRepository
        .addDiary(map['content'], map['emoji'], map['uid'])
        .then((value) {
      switch (value) {
        case Status.error:
          break;
        case Status.success:
          Get.snackbar('저장 완료!', '일기가 등록되었습니다.');
          Get.offAllNamed('/home');
          break;
      }
    });
  }

  Future deleteUserInfoInDB(String id) async {
    DiaryRepository diaryRepository = DiaryRepository();
    await diaryRepository.deleteDiary(id).then((result) {
      switch (result) {
        case Status.error:
          break;
        case Status.success:
          Get.snackbar('삭제 완료!', '일기가 삭제되었어요');
          break;
      }
    });
  }

  Future readDiaryToDB() async {
    try {
      CollectionReference userDiary = FirebaseFirestore.instance
          .collection(collection1)
          .doc(uid)
          .collection(collection2);
      QuerySnapshot querySnapshots = await userDiary.get();
      for (var snapshot in querySnapshots.docs) {
        var documentID = snapshot.id;
        docIDs.add(documentID);
        print('documentID: $documentID');
        await userDiary.doc(documentID).get().then((DocumentSnapshot data) {
          var diaryContent = data['content'];
          content = diaryContent;
          var diaryEmoji = data['emoji'];
          emoji = diaryEmoji;
          var diaryDate = data['date'];
          date = diaryDate;
          update();
        });
      }
    } catch (e) {
      print(e);
      return Status.error;
    }

    return Status.success;
  }
}
