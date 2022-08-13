import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesInterface {
  Future<SharedPreferences> init();
  Future<String?> readString(String key);
  Future writeString(String key);
}