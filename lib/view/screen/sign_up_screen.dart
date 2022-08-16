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

  late TextEditingController userEmail = TextEditingController();
  late TextEditingController userPassword = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  late TextEditingController userName = TextEditingController();
  bool isSignUp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // myFocusNode에 포커스 인스턴스 저장.
  }

  @override
  Widget build(BuildContext context) {
    bool isDisable = true;
    bool isEmailCorrected = false;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldWidget(
                          // suffixButtonText: '중복확인',
                          textEditingController: userEmail,
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
                            // signUpController.checkDuplicatedID();
                            isEmailCorrected = true;
                            signUpController.email = val;
                            print(userEmail.text);
                            return null;
                          },
                          fieldTitle: '아이디',
                          hintText: '이메일을 입력하세요!',
                        ),
                        TextFieldWidget(
                          textEditingController: userPassword,
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
                          textEditingController: confirmPassword,
                          validator: (val) {
                            if (val != userPassword.text) {
                              return '비밀번호가 일치하지 않아요';
                            }
                            signUpController.pwd = val;
                            return null;
                          },
                          fieldTitle: '비밀번호 확인',
                        ),
                        TextFieldWidget(
                          textEditingController: userName,
                          validator: (val) {
                            if (val.length < 1) {
                              return '닉네임은 필수사항입니다.';
                            }
                            signUpController.name = val;
                            print('userName.text:: ${userName.text}');
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
                  if (_formKey.currentState!.validate()) {
                    print('132');
                    // _formKey.currentState!.save();
                    Map<String, dynamic> map = {
                      'id': signUpController.email,
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
