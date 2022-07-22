import 'package:flutter/material.dart';
import 'package:today_dot/view/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider는 가장 최상위 위젯(MaterialApp)에서 감싸준다.
    return const MaterialApp(home: SignUpScreen());
  }
}
