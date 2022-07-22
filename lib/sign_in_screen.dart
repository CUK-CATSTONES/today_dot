import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/textbutton.dart';

import 'button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFDF9),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFFFFDF9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
              child: Text('오늘의 마침표.', style: TextStyle(fontSize: 32.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ Text('아이디', style: TextStyle(fontSize: 16.0),),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffC4DDFF),
                          ),
                        ),

                        filled: true,
                        fillColor: Color(0xffC4DDFF),
                      ),
                    ),]
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 3, 40, 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ Text('비밀번호', style: TextStyle(fontSize: 16.0),),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffC4DDFF),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xffC4DDFF),
                      ),
                    ),]
              ),
            ),
            AppButtons(
                buttonColor: Color(0xff92B4EC),
                text: '로그인',
                onTapFunction: (){
                  // 홈화면 이동
                  /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );*/
                  print('login');
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 7, 55, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text('회원이 아니신가요?',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff949494),
                  ),
                ),
                  TextButtons(
                    text: '회원가입',
                    textColor : Colors.black,
                    onTapFunction: (){
                      //print('회원가입');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
