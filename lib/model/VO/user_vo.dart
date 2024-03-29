class UserVO {
  String uid = '';
  String email = '';
  String name = '';

  UserVO({
    required this.uid,
    required this.email,
    required this.name,
  });

  UserVO.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        name = json['name'];

  Map<String, dynamic> toJson() => {'uid': uid, 'email': email, 'name': name};

  UserVO.fromMap(Map<String, dynamic> user)
      : uid = user['uid'],
        email = user['email'],
        name = user['name'];

  @override
  String toString() {
    return '{uid:$uid, email:$email, name:$name}';
  }
}
