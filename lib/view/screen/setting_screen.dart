import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'change_name_screen.dart';

class SettingScreen extends StatelessWidget{
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 2,
        title: const Text('설정', style: TextStyle(color: Colors.black, fontSize: 25),),
        backgroundColor: Color(0xFFFFFDF9),
        elevation: 0,
        actions: <Widget> [
          new IconButton(
            iconSize: 40,
            icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: (){
                Get.toNamed('/home');
              },
          )
        ],
      ),
      body: Container(
        color: Color(0xFFFFFDF9),
        child: Container(
          padding: EdgeInsets.all(12),
          width: 343,
          height: 123,
          // color: Colors.black,
          margin: EdgeInsets.fromLTRB(25,60,25,0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => ChangeNameScreen()),);
                    },
                    icon: Icon(Icons.edit, size: 30,),
                  ),
                  TextButton(
                      onPressed:  (){
                        //print('닉네임변경');
                        Navigator.push(context, MaterialPageRoute(builder:
                         (context) => ChangeNameScreen()),);

                      }, child: Text('닉네임변경', style: TextStyle(color: Colors.black, fontSize:22 ),),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                 ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Get.toNamed('/');
                    },
                    icon: Icon(Icons.logout, size: 35,),
                  ),
                  TextButton(
                    onPressed:  (){
                      Get.toNamed('/');
                    }, child: Text('로그아웃', style: TextStyle(color: Colors.black, fontSize:22 ),),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
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