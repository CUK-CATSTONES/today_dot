import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_dot/model/repository/impl/shared_preferences_impl.dart';

class changeNameController extends SharedPreferencesImpl{
  late SharedPreferences _prefs;
  Future<String?> getString(String name) async{
    try{
      await super.init();
      return await readString(name);
    } catch(e){
      print(e);
    }
    return null;
  }
  Future<String> readString(String name) async{
    String? username = _prefs.getString(name) ?? '닉네임';
    return username;
  }
}

