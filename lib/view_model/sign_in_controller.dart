import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';
import 'package:today_dot/view_model/user_controller.dart';

class SignInController extends GetxController {
  late String email;
  late String pw;

  Future signIn(Map<String, dynamic> map) async {
    print('signIn map email: ${map['email']}');
    print('signIn map pw: ${map['pw']}');
    Get.defaultDialog(
      barrierDismissible: false,
      title: '로그인하는 중..',
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );

    AuthRepository.signIn(map['email'], map['pw']).then(
      (value) async {
        print('signIn controller result:: $value');
        switch (value) {
          case Status.signIn:
            Get.back();
            Get.snackbar('로그인 완료', '환영해요!');
            Get.offAllNamed('/home');
            break;
          case Status.userNotFound:
            Get.back();
            Get.snackbar('사용자 정보 없음', '입력한 정보를 다시 확인해주세요');
            break;
          default:
            Get.back();
            Get.snackbar('로그인 불가', '로그인을 할 수 없습니다');
            break;
        }
      },
    );

    // AuthRepository.emailAndpwd(email: email, pwd: pw)
    //     .signIn()
    //     .then((result) async {
    //   switch (result) {
    //     case Status.success:
    //       Get.back();
    //       await UserController().readUserInfoToDB();
    //       print('success!!!');
    //       break;
    //     case Status.userNotFound:
    //       Get.back();
    //       Get.snackbar('로그인 실패', '해당 아이디 정보가 없어요.');
    //       break;
    //     default:
    //       Get.back();
    //       Get.snackbar('로그인 실패', '다시 시도해주세요.');
    //       break;
    //   }
    // });
  }
}
