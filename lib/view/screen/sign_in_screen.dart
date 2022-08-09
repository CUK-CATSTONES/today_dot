import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:today_dot/view/widget/button_widget.dart';
import 'package:today_dot/view_model/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _signInController = Get.put(SignInController());

    bool _validatedID = false;
    bool _validatedPWD = false;
    late TextEditingController userEmail = TextEditingController();
    late TextEditingController userPassword = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFFFFDF9),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 40),
              child: Text(
                '오늘의 마침표.',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFieldWidget(
                fieldTitle: '아이디',
                hintText: 'ex) hello@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _validatedID = false;
                    return '아이디를 입력해주세요';
                  } else {
                    _validatedID = true;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 45),
              child: TextFieldWidget(
                fieldTitle: '비밀번호',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _validatedPWD = false;
                    return '비밀번호를 입력하세요.';
                  } else {
                    _validatedPWD = true;
                  }
                  return null;
                },
              ),
            ),
            ButtonWidget(
                bgColor: const Color(0xff92B4EC),
                label: '로그인',
                onTap: () {
                  if (_validatedID == true && _validatedPWD == true) {
                    _signInController.signIn(userEmail.text, userPassword.text);
                    Get.toNamed('home');
                  } else if (_validatedID == false || _validatedPWD == false) {
                    Get.snackbar('로그인 불가', '아이디 또는 비밀번호를 다시한번 확인해주세요');
                  } else {
                    Get.snackbar('로그인 불가', '로그인에 실패하였습니다.');
                  }
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 0, 55, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '회원이 아니신가요?',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff949494),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.toNamed('/signUp');
                    },
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
