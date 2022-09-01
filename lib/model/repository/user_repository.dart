import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/model/VO/user_vo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:today_dot/model/asset/status.dart';

class UserRepository {
  UserVO? user;
  String collection = 'user';

  /// 회원가입된 정보에 uid를 추가해서 firestore에 저장한다.
  void addUserInfoUID(Map<String, dynamic> map) async {
    map.addAll({'uid': FirebaseAuth.instance.currentUser!.uid});
    user = UserVO.fromMap(map);
  }
  /*
  Firestore.instance.collection(colName).add({
      fnName: name,
      fnDescription: description,
      fnDatetime: Timestamp.now(),
    });
    */

  /// user 정보 생성
  Future addUserInfo(String userEmail, String userName) async {
    try {
      Map<String, dynamic>? map = user?.toJson();
      //       CollectionReference userDiary = FirebaseFirestore.instance
      //     .collection(collection1)
      //     .doc(uid)
      //     .collection(collection2);
      // var userID = userDiary.doc().id;

      /*      await userDiary.doc(userID).set({
        'date': formattedDate,
        'content': content,
        'emoji': emoji,
        'uid': uid,
        'docID': userID
      });
      */
      CollectionReference userData =
          FirebaseFirestore.instance.collection(collection);
      // await userData.add({'email': userEmail, 'name': userName});
      var userID = FirebaseAuth.instance.currentUser!.uid;
      await userData
          .doc(userID)
          .set({'email': userEmail, 'name': userName, 'uid': userID});
    } catch (e) {
      print('35: $e');
      return Status.error;
    }
    return Status.success;
  }

  /*
  db.collection("users").get().then(function(querySnapshot) {
    querySnapshot.forEach(function(doc) {
        var id = doc.id; // randomly generated document ID
        var data = doc.data(); // key-value pairs from the document
    });
});
*/

  /// user 정보 가져오기
  Future readUserInfo(String uid) async {
    DocumentSnapshot document;
    try {
      CollectionReference userData =
          FirebaseFirestore.instance.collection(collection);
      document = await userData.doc(uid).get();
      print('document is...$document');
    } catch (e) {
      print(e);
      return Status.error;
    }
    if (document.data() == null) {
      return Status.userNotFound;
    }
    user = UserVO.fromMap(document.data() as Map<String, dynamic>);
    return Status.success;
  }
}
