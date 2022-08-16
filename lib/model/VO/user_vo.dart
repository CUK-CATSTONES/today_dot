class UserVO {
  String uid = '';
  String id = '';
  String name = '';

  UserVO({
    required this.uid,
    required this.id,
    required this.name,
  });

  UserVO.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {'uid': uid, 'id': id, 'name': name};

  UserVO.fromMap(Map<String, dynamic> user)
      : uid = user['uid'],
        id = user['id'],
        name = user['name'];

  // factory UserVO.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // ) {
  //   final data = snapshot.data();
  //   return UserVO(
  //     id: data?['id'],
  //     uid: data?['uid'],
  //     name: data?['name'],
  //   );
  // }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "id": uid,
      if (id != null) "id": id,
      if (name != null) "name": name,
    };
  }

  @override
  String toString() {
    return '{uid:$uid, id:$id, name:$name}';
  }
}
