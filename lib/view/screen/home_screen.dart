import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/view/screen/read_diary_component.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                        future: _changeNameController.getName(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData == false) {
                            return const CircularProgressIndicator();
                          } else {
                            return Text(
                              '${snapshot.data.toString()}님,',
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            );
                          }
                        }),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '지금 당신의 ',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          TextSpan(
                            text: '마침표',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '는 어떤가요?',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
