import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/view/widget/diary_container.dart';
import 'package:today_dot/view/screen/read_diary_component.dart';
import 'package:today_dot/view_model/edit_diary_controller.dart';
import 'package:today_dot/view_model/sign_out_controller.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/user_controller.dart';

import '../../view_model/change_name_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _changeNameController = Get.put(ChangeNameController());
  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.settings),
            color: const Color(0xff121212),
            onPressed: () {
              Get.toNamed('/setting');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffffff),
        onPressed: () {
          Get.offAllNamed('/editDiary');
        },
        child: const Icon(
          Icons.add,
          color: Color(0xff92B4EC),
        ),
      ),
      body: Center(
        child: Container(
          color: const Color(0xFFFFFDF9),
          child: Column(
            children: [
              Container(
                width: 335,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: _changeNameController.getName(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData == false) {
                            return const CircularProgressIndicator();
                          } else {
                            // print('84');
                            _changeNameController
                                .getName()
                                .then((value) => print('value::: ${value}'));
                            return Text(
                              snapshot.data.toString(),
                              style: const TextStyle(
                                fontSize: 27,
                                // fontSize: 10,
                              ),
                            );
                          }
                        }),
                    const Text(
                      '의 마침표',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('user')
                        .doc(_userController.uid)
                        .collection('diary')
                        .orderBy('date', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<ReadDiaryComponent> diaryContainers = [];
                      if (snapshot.hasData) {
                        // print(
                        //     '_diaryController.docIDs.length: ${_diaryController.docIDs.length}');
                        final diaries = snapshot.data!.docs;
                        for (var diary in diaries) {
                          final docID = diary.reference.id;
                          final diaryDate = diary.get('date');
                          final diaryEmoji = diary.get('emoji');
                          final diaryContent = diary.get('content');
                          final diaryContainer = ReadDiaryComponent(
                              date: diaryDate,
                              content: diaryContent,
                              emoji: diaryEmoji,
                              id: docID);
                          diaryContainers.add(diaryContainer);
                        }
                        return ListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: diaryContainers,
                        );
                      } else if (snapshot.hasError) {
                        return const Text('error...');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
