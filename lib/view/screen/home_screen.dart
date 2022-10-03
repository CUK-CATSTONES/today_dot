import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:today_dot/view/screen/read_diary_component.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/user_controller.dart';
import 'package:today_dot/view_model/change_name_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            iconSize: 30.sp,
            icon: const Icon(Icons.settings),
            color: const Color(0xff121212),
            onPressed: () {
              Get.offAllNamed('/setting');
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
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'cafe24',
                              ),
                            );
                          }
                        }),
                    SizedBox(height: 10.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '지금 당신의 ',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: 'cafe24',
                            ),
                          ),
                          TextSpan(
                            text: '마침표',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: 'cafe24',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '는 어떤가요?',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: 'cafe24',
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
                      if (snapshot.hasError) {
                        return Column(
                          children: const [
                            Text('알 수 없는 오류가 생겼어요.'),
                            Text('관리자에게 문의 부탁드립니다.'),
                          ],
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '오늘 하루 순간순간 느낀 감정을 기록해보세요 :)',
                                style: TextStyle(
                                  // fontSize: width * 0.08,
                                  fontFamily: 'nexon',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        );
                      }
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
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
