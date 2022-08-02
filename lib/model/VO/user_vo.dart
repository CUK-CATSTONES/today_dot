import 'package:flutter/material.dart';
import 'dart:convert';

class UserVO {
  String id = '';
  String pwd = '';
  String name = '';

  UserVO({
    required this.id,
    required this.pwd,
    required this.name,
  });

  UserVO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pwd = json['pwd'],
        name = json['name'];

  Map<String, dynamic> ToJson() => {'id': id, 'pwd': pwd, 'name': name};

  UserVO.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        pwd = user['pwd'],
        name = user['name'];

  @override
  String toString() {
    return '{id:$id, pwd:$pwd, name:$name}';
  }
}
