class UserVO {
  String id = '';
  String uid = '';
  String name = '';

  UserVO({
    required this.id,
    required this.uid,
    required this.name,
  });

  UserVO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        uid = json['pwd'],
        name = json['name'];

  Map<String, dynamic> ToJson() => {'id': id, 'pwd': uid, 'name': name};

  UserVO.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        uid = user['pwd'],
        name = user['name'];

  @override
  String toString() {
    return '{id:$id, pwd:$uid, name:$name}';
  }
}
