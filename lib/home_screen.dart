import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/diary_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget listview_builder(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFDF9),
        elevation: 0,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(25),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          child: Container(
            width: 335,
            height: 75,
            child: Center(
              child: Text('글1', style: TextStyle(color: Colors.black),),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xffC4DDFF),
            ),
          );
        }
        ),
    );
  }
}
/*
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
           Text('###의 마침표', style(fontSize: 27.0, color: Colors.black),),
         children: [
              ContainerWidget(
                borderRadius: 25.0,
                boxColor: Color(0xffFFFFFF),
                text: Text(
                  '###의 마침표',
                  style: TextStyle(fontSize: 27.0, color: Colors.black),
                ),
              ),
            Padding(
              padding: EdgeInsets.zero,
              child: ContainerWidget(
                  borderRadius: 25.0,
                boxColor: Colors.black,
              ),
            ),
          ]
        ),
      ),
    );
*/