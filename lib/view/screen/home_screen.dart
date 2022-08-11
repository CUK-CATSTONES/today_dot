import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/sign_in_screen.dart';

import '../widget/diary_container.dart';

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
        child: Card(
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
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    // backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(20, 10, 5, 10) ,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('일기를 삭제할까요?'),
                                                IconButton(onPressed: ()=>Navigator.of(context).pop(false), icon: Icon(Icons.close, size: 30, ),),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text('취소', style: TextStyle(color:Color(0xff888585))),),
                                              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text('확인', style: TextStyle(color:Colors.black),)),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    // title: const Text('일기를 삭제할까요?'),
                                    // actions: [
                                    //   TextButton(
                                    //     onPressed: () {
                                    //       Navigator.of(context).pop(false);
                                    //     },
                                    //     child: const Text('취소'),
                                    //
                                    //   ),
                                    //   TextButton(
                                    //     onPressed: () {
                                    //       Navigator.of(context).pop(true);
                                    //     },
                                    //     child: const Text('확인'),
                                    //
                                    //   ),
                                    // ],
                                  );
                                });
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 15,),
                                  Text('2022.08.02',
                                    textAlign: TextAlign.left,),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 30),),
                                  Image.asset("images/happy_emoji.png", width:40, height:40),
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
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
