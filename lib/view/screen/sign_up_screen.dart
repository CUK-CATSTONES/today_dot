import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDisable = true;
  bool isEmailCorrected = false;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController userEmail = TextEditingController();
  late TextEditingController userPassword = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  late TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFDF9),
        elevation: 0,
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus(); // 다른 곳을 누르면 keyboard가 사라진다.
        },
        child: Container(
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
                  child: Form(
                    // Form 위젯은 컨테이너처럼 동작하면서, 여러개의 form field를 그룹화하고 적합성을 확인함
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldWidget(
                          controller: userEmail,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '이메일을 입력해주세요';
                            } else if (!val.contains('@')) {
                              isEmailCorrected = false;
                              return '이메일 형식이 맞지 않습니다';
                            }
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(val)) {
                              isEmailCorrected = false;
                              return '잘못된 이메일 형식입니다.';
                            }

                            /// 정상적으로 이메일을 입력했을 때
                            isEmailCorrected = true;
                            print(userEmail.text);
                            return '사용가능한 아이디입니다';
                          },
                          fieldTitle: '아이디',
                          hintText: '이메일을 입력하세요!',
                          suffixButtonText: '중복확인',
                        ),
                        TextFieldWidget(
                          controller: userPassword,
                          validator: (val) {
                            if (val!.isEmpty || val.length < 6) {
                              return '6자 이상 입력해주세요!';
                            }

                            print(userPassword.text);
                            return null;
                          },
                          fieldTitle: '비밀번호',
                          hintText: '6자 이상 입력해주세요:)',
                        ),
                        TextFieldWidget(
                          controller: confirmPassword,
                          validator: (val) {
                            if (val != userPassword.text) {
                              return '비밀번호가 일치하지 않아요';
                            }
                            return null;
                          },
                          fieldTitle: '비밀번호 확인',
                        ),
                        TextFieldWidget(
                          controller: userName,
                          validator: (val) {
                            if (val.length < 1) {
                              return '닉네임은 필수사항입니다.';
                            }
                            print(userName.text);
                            return null;
                          },
                          fieldTitle: '닉네임',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    // isDisable = true;
                    // return;
                    print('--------');
                    print(userEmail.text);
                    print(userPassword.text);
                    print(userName.text);
                  }
                  Get.snackbar('회원가입', '완료우');
                },
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
      ),
    );
  }
}
