import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/sign_out_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignOutController signOutController = SignOutController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 2,
        title: const Text(
          '  Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Gmarket',
          ),
        ),
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            iconSize: 40,
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Get.offAllNamed('/home');
            },
          )
        ],
      ),
      body: Container(
        color: const Color(0xFFFFFDF9),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 343,
          height: 123,
          margin: const EdgeInsets.fromLTRB(25, 60, 25, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(
              width: 1,
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
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
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
                    child: const Text(
                      '닉네임변경',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
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
                    icon: const Icon(
                      Icons.logout,
                      size: 35,
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
                    child: const Text(
                      '로그아웃',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
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
      ),
    );
  }
}
