import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';
import 'package:today_dot/view_model/sign_out_controller.dart';
import 'package:today_dot/view_model/user_controller.dart';

class SignUpController extends GetxController {
  String email = '';
  String pwd = '';
  String name = '';

  bool isDuplicateEmail = false;
  bool isDuplicatePWD = false;
  bool isEmailCorrected = false;
  bool isEmailVerified = false;

  /// 2. validator 하나씩만 되게끔

  /// email을 입력하고 중복확인 버튼을 눌렀을때
  // Future checkDuplicatedID() async {
  //   await AuthRepository.id(id: email).checkEmailExist().then(
  //     (value) {
  //       print('---');
  //       print(value);

  //       switch (value) {
  //         case 'success':
  //           isDuplicateID = false; //중복되지 않음
  //           Get.snackbar('사용가능!', '사용 가능한 아이디 입니다.');
  //           break;
  //         case 'alreadyExist':
  //           isDuplicateID = true; //중복됨
  //           Get.snackbar('사용불가', '이미 동일한 아이디가 존재합니다!!');
  //           break;
  //         case 'invalid-email':
  //           Get.snackbar('invalid', 'invalid-email');
  //           break;
  //         default:
  //           isDuplicateID = true;
  //           break;
  //       }
  //     },
  //   );
  // }

  Future signUp(Map<String, dynamic> map) async {
    print('map email: ${map['email']}');
    print('map pw: ${map['pw']}');

    Get.defaultDialog(
      barrierDismissible: false,
      title: '회원가입 시도중,,',
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );
    AuthRepository.signUp(map['email'], map['pw']).then((value) async {
      print('48 $value');
      switch (value) {
        case Status.emailAlreadyExist:
          Get.back(); // dialog를 끔
          Get.snackbar('회원가입 불가', '이미 가입된 계정이 있습니다.');
          break;
        case Status.error:
          Get.back(); // dialog를 끔
          Get.snackbar('회원가입 불가', '오류가 발생하였습니다.');
          break;
        case Status.success:
          Get.back();
          await UserController().addUserInfoToDB({
            'email': map['email'],
            'name': map['name'],
          });
          // await sendEmailVerification();
          // await SignOutController().signOut();
          Get.offAllNamed('/home');
          Get.snackbar('회원가입 완료', '회원가입을 축하드려요:>');
          break;

        default:
          Get.back();
          Get.snackbar('회원가입 불가', '다시 시도해주세요');
          break;
      }
    });
  }

  Future sendEmailVerification() async {
    Get.defaultDialog(
      barrierDismissible: false,
      title: '인증 이메일 발송중',
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      content: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );
    AuthRepository().sendEmailVerification().then((value) {
      switch (value) {
        case Status.error:
          isEmailVerified = false;

          /// 회원가입 버튼을 눌러도 가입이 되면 안됨
          Get.back();
          Get.snackbar('실행 중 오류', '다시 한번 시도해주세요');
          break;
        case Status.success:
          isEmailVerified = true;

          /// 그대로 회원가입을 진행해야힘
          Get.back();
          Get.snackbar('이메일 발송 완료!', '입력하신 이메일을 통해 인증을 진행해주세요');
          break;
        case Status.alreadyVerified:
          isEmailVerified = false;

          /// 그대로 회원가입을 진행해야함
          Get.back();
          Get.snackbar('인증 불가', '이미 인증된 이메일입니다.');
          break;
        default:
      }
    });
  }
}
