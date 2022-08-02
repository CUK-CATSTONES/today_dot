import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/sign_in_screen.dart';

import 'diary_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFDF9),
        elevation: 0,
        actions:  <Widget> [
          new IconButton(
            iconSize: 30,
            icon: Icon(Icons.settings),
            color: Color(0xff121212),
            onPressed: () {
              print("Settings");
              // 설정화면 이동
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );*/
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffffff),
        onPressed: () {
          print("add diary");
        },
        child: Icon(
            Icons.add,
          color: Color(0xff92B4EC),
        ),
      ),
      body: Container(
        color: Color(0xFFFFFDF9),
        child: Column(
            children: [
              ContainerWidget(
                borderRadius: 25.0,
                text: '###의 마침표',
                fontsize: 27,
              ),
          Padding(padding: EdgeInsets.all(15),),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(25),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Text('2022.08.02',
                          textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 30),),

                        ],
                      ),
                      Container(
                        width: 335,
                        height: 100,
                        child: Center(
                          child: Text('글1', style: TextStyle(color: Colors.black),),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0x4dC4DDFF),
                        ),
                      ),
                      Container(
                        height: 20,
                      )
                    ],
                  );
                }
            ),
          ),
          ]
        ),
      ),
    );
  }
}

