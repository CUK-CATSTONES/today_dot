import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';

import '../widget/button_widget.dart';
import '../../home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                validator: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 45),
              child: TextFieldWidget(
                fieldTitle: '비밀번호',
                validator: (value) {},
              ),
            ),
            ButtonWidget(
                bgColor: const Color(0xff92B4EC),
                label: '로그인',
                onTap: () {
                  // 홈화면 이동
                  // print('login');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
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
                      print('회원가입');
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