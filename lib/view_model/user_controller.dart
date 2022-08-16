import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/user_repository.dart';

class UserController extends GetxController {
  UserRepository userRepository = UserRepository();
  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future addUserInfoToDB(Map<String, dynamic> map) async {
    userRepository.addUserInfoUID(map);
    userRepository.addUserInfo().then((value) {
      switch (value) {
        case Status.error:
          print('회원가입 에러님;;;');
          break;
        case Status.success:
          print('회원가입 성공임');
          break;
      }
    });
  }

  Future readUserInfoToDB() async {
    if (uid != null) {
      userRepository.readUserInfo(uid!).then((value) {
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
            print('user controller 37');
            Get.offAllNamed('/home');
            break;
        }
      });
    }
  }
}
