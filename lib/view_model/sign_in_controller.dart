import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';

class SignInController extends GetxController {
  late String email;
  late String pw;

  Future signIn(Map<String, dynamic> map) async {
    print('signIn map email: ${map['email']}');
    print('signIn map pw: ${map['pw']}');
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
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
  }
}
