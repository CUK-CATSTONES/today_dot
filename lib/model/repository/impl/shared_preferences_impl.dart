import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_dot/model/interface/shared_preference_interface.dart';

class SharedPreferencesImpl implements SharedPreferencesInterface{
  late SharedPreferences _prefs;

  late String _username;
  @override
  Future<SharedPreferences> init() async{
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  @override
  Future<String> readString(String name) async{
    String? username = await _prefs.getString(name) ?? '게스트';
    return username;
  }

  @override
  Future writeString(String newName) async{
    _prefs.setString('name', newName);
  }
}
