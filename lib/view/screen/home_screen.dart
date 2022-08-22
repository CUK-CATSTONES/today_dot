import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/view/widget/diary_container.dart';
import 'package:today_dot/view_model/sign_out_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return Container(
              width: 335,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xffC4DDFF),
              ),
              child: const Center(
                child: Text(
                  '글1',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }),
    );
  }
}
