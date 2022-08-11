import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:today_dot/view/screen/setting_screen.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';

import '../widget/button_widget.dart';

class ChangeNameScreen extends StatelessWidget{
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     appBar: AppBar(
       backgroundColor: Color(0xFFFFFDF9),
       elevation: 0,
       actions: <Widget> [
         new IconButton(
           iconSize: 40,
           icon: Icon(Icons.close),
           color: Colors.black,
           onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => SettingScreen()),
             );
           },
         )
       ],
     ),

     body: Container(
       width: double.infinity,
       color: Color(0xFFFFFDF9),
       child: Column(
         children: [
           Text('닉네임변경',style: TextStyle(fontSize: 32.0),),
           Padding(
             padding: EdgeInsets.fromLTRB(20,85,20,240),
             child: TextFieldWidget(
             fieldTitle: '변경 할 닉네임',
             validator: (value) {},
           ),
           ),
           ButtonWidget(
               bgColor: const Color(0xff92B4EC),
               label: '저장하기',
               onTap: () {
                 print("저장");
               }),

         ],
       ),
   ),

   );
  }
}