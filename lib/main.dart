import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/view/screen/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    Status _authStatus;
    if (user == null) {
      _authStatus = Status.signOut;
      print('User is currently signed out!');
    } else {
      _authStatus = Status.signIn;
      print('User is signed in!');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider는 가장 최상위 위젯(MaterialApp)에서 감싸준다.
    return GetMaterialApp(
      home: SignUpScreen(),
      theme: ThemeData(
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder())),
    );
  }
}
