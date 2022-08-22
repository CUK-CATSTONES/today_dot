import 'dart:html';

import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseInterface {
  Future<Firebase> init();
  Future<String?> readDiary(String date);
  Future writeDiary(String key);
  Future removeDiary(String key);
}
