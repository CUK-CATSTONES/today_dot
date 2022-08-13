import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_dot/model/repository/impl/shared_preferences_impl.dart';

class changeNameController extends SharedPreferencesImpl{
  late SharedPreferences _prefs;
  Future<String?> getName() async{
    try{
      _prefs = await super.init();
      return await readString('name');
    } catch(e){
      print(e);
    }
    return null;
  }
  Future<String> readString(String name) async{
    await _prefs.setString('name','황주연');
    String? username = _prefs.getString(name) ?? '닉네임';
    // print(username);
    return username;
  }

  Future<String?> setName(String name) async{
    try{
      _prefs = await super.init();
      return await writeString(name);
    } catch(e){
      print(e);
    }
    return null;
  }
  Future writeString(String value) async{
    await _prefs.setString('name', value.toString());
   // String? username = _prefs.getString('name') ?? '닉네임';
    //print(username);
    // return username;
    return await _prefs.setString('name', value.toString());
  }
}
