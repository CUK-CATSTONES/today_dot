import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_dot/model/repository/impl/shared_preferences_impl.dart';
import 'package:today_dot/view_model/user_controller.dart';

class ChangeNameController extends SharedPreferencesImpl {
  final _userController = Get.put(UserController());
  late SharedPreferences _prefs;

  Future<String?> getName() async {
    try {
      _prefs = await super.init();
      return await readString('name');
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String> readString(String name) async {
    String? username = await _prefs.getString('name') ?? '테스트';
    return username;
  }

  Future<String?> setName(String name) async {
    try {
      _prefs = await super.init();
      return await writeString(name);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future writeString(String newName) async {
    await _prefs.setString('name', newName.toString()).then((result) {
      if (result) {
        getName();
      } else {
        return null;
      }
    });
  }
}
