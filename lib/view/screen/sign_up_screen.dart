import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/view_model/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignUpController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController userName = TextEditingController();
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    bool isEmailCorrect = false;
    bool isPWCorrect = false;
    bool isNameCorrect = false;
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                // suffixButtonText: '중복확인',
                                controller: userEmail,
                                validator: (val) {
                                  signUpController.email = '';
                                  if (val!.isEmpty) {
                                    isEmailCorrect = false;
                                    return '이메일을 입력해주세요';
                                  }
                                  // else if (!val.contains(RegExp(r'[@]'))) {
                                  //   isEmailVerified = false;
                                  //   return '이메일 형식이 맞지 않습니다';
                                  // }

                                  /// 정상적으로 이메일을 입력했을 때
                                  // signUpController.checkDuplicatedID();
                                  isEmailCorrect = true;
                                  signUpController.email =
                                      val.trim() + '@gmail.com';
                                  print(userEmail.text);
                                  return null;
                                },
                                fieldTitle: '아이디',
                                hintText: '이메일을 입력하세요!',
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            const Text(
                              '@gmail.com',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 50.0,
                        //   child: CupertinoButton(
                        //     padding: const EdgeInsets.all(0),
                        //     onPressed: () async {
                        //       print('이메일 인증 버튼 클릭');
                        //       await signUpController.sendEmailVerification();
                        //     },
                        //     color: const Color(0xffD6E5FA),
                        //     child: const Text(
                        //       "이메일 인증",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        TextFieldWidget(
                          controller: userPassword,
                          validator: (val) {
                            signUpController.pwd = '';
                            if (val!.isEmpty || val.length < 6) {
                              isPWCorrect = false;
                              return '6자 이상 입력해주세요!';
                            }
                            signUpController.pwd = val;
                            isPWCorrect = true;
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
                              isPWCorrect = false;
                              return '비밀번호가 일치하지 않아요';
                            }
                            // signUpController.pwd = val;
                            isPWCorrect = true;
                            return null;
                          },
                          fieldTitle: '비밀번호 확인',
                        ),
                        TextFieldWidget(
                          controller: userName,
                          validator: (val) {
                            signUpController.name = '';
                            if (val.length < 1) {
                              isNameCorrect = false;
                              return '닉네임은 필수사항입니다.';
                            }
                            signUpController.name = val.trim();
                            isNameCorrect = true;
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
                onTap: () async {
                  if (_formKey.currentState != null ||
                      (isEmailCorrect == true &&
                          isPWCorrect == true &&
                          isNameCorrect == true)) {
                    print('132');
                    Map<String, dynamic> map = {
                      'email': signUpController.email,
                      'pw': signUpController.pwd,
                      'name': signUpController.name,
                    };
                    print('139');
                    await signUpController.signUp(map);
                  } else {
                    Get.snackbar('error', '다시 한번 시도해주세요');
                  }
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
