import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/edit_diary_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadDiaryComponent extends StatelessWidget {
  final _editDiaryController = Get.put(EditDiaryController());
  final String date;
  final String content;
  final String emoji;
  final String id;

  ReadDiaryComponent({
    Key? key,
    required this.date,
    required this.content,
    required this.emoji,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 339.w,
          height: 168.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0x4dC4DDFF),
          ),
          child: Column(
            children: [
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        date,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff979797),
                          fontSize: 15.sp,
                          fontFamily: 'cafe24',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 30),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Container(
                                  height: 140.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 5, 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '일기를 삭제할까요?',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: 'nexon',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                size: 25.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child: const Text(
                                                '취소',
                                                style: TextStyle(
                                                  color: Color(0xff888585),
                                                  fontFamily: 'nexon',
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _editDiaryController
                                                    .deleteUserInfoInDB(id);
                                                Get.back();
                                              },
                                              child: const Text(
                                                '확인',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 108, 151, 218),
                                                  fontFamily: 'nexon',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 13.w),
                  Image.asset(emoji, width: 60.w, height: 60.h),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        content,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gmarket',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 20.h,
        ),
      ],
    );
  }
}
