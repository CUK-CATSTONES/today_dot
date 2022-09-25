import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/VO/user_vo.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/user_repository.dart';

class UserController extends GetxController {
  late UserVO? user;
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future addUserInfoToDB(Map<String, dynamic> map) async {
    UserRepository userRepository = UserRepository();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    userRepository.addUserInfoUID(map);
    userRepository.addUserInfo(map['email'], map['name']).then((value) {
      switch (value) {
        case Status.error:
          print('회원가입 에러남;;;');
          break;
        case Status.success:
          print('회원가입 성공임');
          break;
      }
    });
  }

  Future readUserInfoToDB() async {
    UserRepository userRepository = UserRepository();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      userRepository.readUserInfo(uid).then((value) {
        switch (value) {
          case Status.error:
            print('user controller 29');
            Get.offAllNamed('/');
            break;
          case Status.userNotFound:
            print('user controller 33');
            Get.offAllNamed('/');
            break;
          case Status.success:
            user = userRepository.user;
            print('user controller 44');
            Get.offAllNamed('/home');
            break;
        }
      });
    }
  }

  Future<String?> readUserName() async {
    UserRepository userRepository = UserRepository();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    String userName = '';
    try {
      FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .snapshots()
          .listen((docSnapshot) async {
        if (docSnapshot.exists) {
          Map<String, dynamic> data = docSnapshot.data()!;
          userName = await data['name'];
        } else {
          userName = '게스트';
        }
        print(userName);
      });
    } catch (e) {
      print(e);
    }
    return userName;
  }
}
