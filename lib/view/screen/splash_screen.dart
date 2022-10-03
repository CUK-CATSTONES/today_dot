import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/view_model/sign_in_controller.dart';
import 'package:today_dot/view_model/user_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final signController = Get.put<SignInController>;
  late Future init;

  @override
  void initState() {
    super.initState();
    init = initRoute();
  }

  Future initRoute() async {
    Timer(const Duration(seconds: 1), () async {
      print('32');
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        Status status = Status.signOut;
        if (user == null) {
          status = Status.signOut;
          Get.offAllNamed('/signIn');
          print('signOut');
        } else {
          status = Status.signIn;
          Get.offAllNamed('/home');
          print('signIn');
        }
        print(user);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: init,
          builder: (context, snapshot) {
            return Center(
              child: Image.asset(
                'images/splashLogo.png',
                height: 150.h,
                width: 278.w,
              ),
            );
          },
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
