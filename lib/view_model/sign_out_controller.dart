import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';

class SignOutController extends GetxController {
  Status? status = Status.signOut;
  Future signOut() async {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );
    if (status != Status.signOut) {
      AuthRepository().signOut().then((result) {
        print(result);
        Get.back();
        Get.snackbar('로그아웃 실패😨', '로그아웃에 실패했습니다.');
      });
    } else {
      Get.offAllNamed('/');
    }
    print(status);
  }
}
