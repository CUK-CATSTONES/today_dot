import 'package:flutter/material.dart';
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
    String? username = _prefs.getString('name') ?? '닉네임';
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
  Future writeString(String newName) async{
    await _prefs.setString('name', newName.toString()).then((result){
      if(result){
        getName();
      } else{
        /* ScaffoldMessenger.of().showSnackBar( // 뭘 적어야하죠?
            SnackBar(
              content: Text('저장 실패ㅠ'),
              duration: Duration(seconds: 5),
            ),);*/
        return null;
      }
    });
  }
}
