import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_dot/view/screen/home_screen.dart';
import 'package:today_dot/view/screen/setting_screen.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';

import '../../view_model/change_name_controller.dart';
import '../widget/button_widget.dart';

class ChangeNameScreen extends StatefulWidget{
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen>{
  final _changeNameController = Get.put(changeNameController());
  final TextEditingController userName = TextEditingController();

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
              Get.toNamed('/setting');
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
                controller: userName,
                fieldTitle: '변경 할 닉네임',
                validator: (val) {
                },
              ),
              ),
            ButtonWidget(
                bgColor: const Color(0xff92B4EC),
                label: '저장하기',
                onTap: () {
                  FutureBuilder(
                      future : _changeNameController.setName(userName.text),
                      builder : (context, snapshot) {
                        /*
                        // ???
                        if(userName.text == 'r'){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('닉네임에 글자를 입력해주세요'), duration: Duration(seconds: 5),),);
                        }*/
                        if(snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        }
                        else {
                          return Text(snapshot.data.toString(), style: TextStyle(fontSize: 27,),);
                        }
                      }
                  );
                  // 저장하는거
                  Get.toNamed('/home');
                }),
          ],
        ),
      ),

    );
  }
}
