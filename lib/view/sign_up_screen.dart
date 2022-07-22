import 'package:flutter/material.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String userEmail;
  late String userPassword;
  late String confirmPassword;
  late String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFDF9),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xffFFFDF9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              '회원가입',
              style: TextStyle(fontSize: 30.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWidget(
                      fieldTitle: '아이디',
                      hintText: '이메일을 입력하세요!',
                      suffixButtonText: '중복확인',
                    ),
                    TextFieldWidget(
                      fieldTitle: '비밀번호',
                      hintText: '6자 이상 입력해주세요:)',
                    ),
                    TextFieldWidget(
                      fieldTitle: '비밀번호 확인',
                    ),
                    TextFieldWidget(
                      fieldTitle: '닉네임',
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => print('tapped'),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Color(0xff92B4EC),
                ),
                child: const Center(
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
