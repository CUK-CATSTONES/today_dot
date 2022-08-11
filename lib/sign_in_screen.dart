// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:today_dot/view/widget/button_widget.dart';
// import 'package:today_dot/view/widget/textfield_widget.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFFDF9),
//         elevation: 0,
//       ),
//       body: Container(
//         width: double.infinity,
//         color: Color(0xFFFFFDF9),
//        child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
//               child: Text('오늘의 마침표.', style: TextStyle(fontSize: 32.0),),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child : TextFieldWidget(
//                 fieldTitle: '아이디', validator: (value) {  },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(30, 0, 30, 45),
//               child : TextFieldWidget(
//                 fieldTitle: '비밀번호', validator: (value) {  },
//               ),
//             ),
//             ButtonWidget(
//                 label: '로그인',
//                   onTap: (){
//                     Get.toNamed('/home');
//                   }),
//
//             Padding(
//               padding: const EdgeInsets.fromLTRB(55, 0, 55, 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [ Text('회원이 아니신가요?',
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     color: Color(0xff949494),
//                   ),
//                 ),
//
//                   TextButton(
//                     child: Text('회원가입',style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),),
//                       style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                     ),
//                     onPressed: (){
//                       print('회원가입');
//                       /*Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpScreen()),
//                       );*/
//                     },
//                   ),
//                 ],
//               ),
//             ),
//     ],
//     )
//     ));
//   }
// }
