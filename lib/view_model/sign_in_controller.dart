import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';
import 'package:today_dot/view_model/user_controller.dart';

class SignInController extends GetxController {
  late String email;
  late String pwd;

  Future signIn(String email, String pw) async {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'signIn controller ttestt',
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );

    // [3]email(id), pw를 이용하여 로그인 시도
    AuthRepository.emailAndpwd(email: email, pwd: pw)
        .signIn()
        .then((result) async {
      switch (result) {
        case Status.success:
          // - UserController 에게 사용자 정보 요청
          await UserController().readUserInfoToDB();
          print('success!!!');
          break;
        case Status.userNotFound:
          Get.back();
          Get.snackbar('로그인 실패', '해당 아이디 정보가 없어요.');
          break;
        default:
          Get.back();
          Get.snackbar('로그인 실패', '다시 시도해주세요.');
          break;
      }
    });
  }
}
