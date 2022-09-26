import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/sign_out_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignOutController signOutController = SignOutController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 2.h,
        title: Text(
          '  Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.sp,
            fontFamily: 'Gmarket',
          ),
        ),
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            iconSize: 40.sp,
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Get.toNamed('/home');
            },
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xFFFFFDF9),
        padding: EdgeInsets.only(right: 25.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.r,8.r,0.r,0.r),
              width: 343.w,
              height: 123.h,
              // color: Colors.black,
              margin: EdgeInsets.fromLTRB(25.r, 60.r, 0.r, 0.r),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  width: 1.w,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed('/changeName');
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 30.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/changeName');
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          '닉네임변경',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontFamily: 'nexon',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await signOutController.signOut();
                        },
                        icon: Icon(
                          Icons.logout,
                          size: 35.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await signOutController.signOut();
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          '로그아웃',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontFamily: 'nexon',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('license>',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.sp,
                  fontFamily: 'Gmarket',
                ),
            ),
              ), onPressed: () {
              Get.toNamed('/license');
                },
            ),],
        ),
      ),
    );
  }
}
