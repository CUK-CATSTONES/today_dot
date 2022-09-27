import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:today_dot/view_model/change_name_controller.dart';
import 'package:today_dot/view_model/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignUpController());
  final _changeNameController = Get.put(ChangeNameController());

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFDF9),
        elevation: 0,
      ),
      body: Container(
        // height: double.infinity,
        color: const Color(0xffFFFDF9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  // Form 위젯은 컨테이너처럼 동작하면서, 여러개의 form field를 그룹화하고 적합성을 확인함
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(
                    shrinkWrap: true,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: userEmail,
                              validator: (val) {
                                signUpController.email = '';
                                if (val!.isEmpty) {
                                  isEmailCorrect = false;
                                  return '이메일을 입력해주세요';
                                }
                                isEmailCorrect = true;
                                signUpController.email =
                                    val.trim() + '@gmail.com';
                                return null;
                              },
                              fieldTitle: '아이디',
                              hintText: '이메일을 입력하세요!',
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Text(
                            '@gmail.com',
                            style: TextStyle(
                                fontSize: 20.0.sp, fontFamily: 'gMarket'),
                          ),
                        ],
                      ),
                      // SizedBox(height: 20.h),
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
                  Map<String, dynamic> map = {
                    'email': signUpController.email,
                    'pw': signUpController.pwd,
                    'name': signUpController.name,
                  };
                  await _changeNameController.setName(signUpController.name);
                  await signUpController.signUp(map);
                } else {
                  Get.snackbar('error', '다시 한번 시도해주세요');
                }
              },
              child: Container(
                width: double.infinity,
                height: 60.0.h,
                decoration: const BoxDecoration(
                  color: Color(0xff92B4EC),
                ),
                child: Center(
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        fontSize: 20.0.sp,
                        color: Colors.black,
                        fontFamily: 'gMarket'),
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
