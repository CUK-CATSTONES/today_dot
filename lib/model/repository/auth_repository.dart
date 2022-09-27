import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today_dot/model/asset/status.dart';

/// firebase.Auth와 관련된 메소드를 실행한다.

class AuthRepository {
  final auth = FirebaseAuth.instance;
  late String email;
  late String pwd;

  AuthRepository();
  AuthRepository.email({required email});
  AuthRepository.emailAndpwd({required email, required pwd});

  /// 로그인
  ///
  /// [로그인]에서 발생할 수 있는 예외의 경우는 총 2가지이다.
  /// 1. invalidEmail
  /// 이메일 형식에 맞지 않은 이메일을 입력한 경우
  /// 2. userNotFound
  /// 로그인 정보를 입력했으나 그와 맞는 사용자가 없는 경우
  /// 3. wrongPassword
  /// 등록한 비밀번호와 다른 비밀번호를 입력한 경우
  /// 4. error
  /// 위 경우 이외의 경우
  static Future<Status> signIn(String email, String pwd) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return Status.invalidEmail;
        case 'user-not-found':
          return Status.userNotFound;
        case 'wrong-password':
          return Status.wrongPassword;
        default:
          return Status.error;
      }
    }
    return Status.signIn;
  }

  /// 회원가입
  ///
  /// [회원가입]에서 발생할 수 있는 예외의 경우는 총 2가지이다.
  /// 1. emailAlreadyExist
  /// 기존에 등록되어 있는 이메일 정보로 회원가입을 시도한 경우
  /// 2. invalidEmail
  /// 이메일 형식에 맞지 않은 이메일을 입력한 경우
  /// 3. error
  /// 위 경우 이외의 경우
  static Future<Status> signUp(String email, String pwd) async {
    try {
      /// email과 pwd 등의 user 정보를 firestore에 저장한다.
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return Status.emailAlreadyExist;
        case 'invalid-email':
          return Status.invalidEmail;
        default:
          return Status.error;
      }
    }
    return Status.success;
  }

  /// 로그아웃
  ///
  Future<Status> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Status.error;
    }
    return Status.success;
  }

  /// email이 중복되는지 확인하기 위해 기존의 로그인되어 있는 계정의 이메일 정보를 확인하는 함수이다.
  Future<String> checkEmailExist() async {
    List list = [];
    try {
      Future<QuerySnapshot<Map<String, dynamic>>> list = FirebaseFirestore
          .instance
          .collection('userData')
          .where('uid', isEqualTo: auth.currentUser?.uid)
          .get();
      // list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(id);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    if (list.isEmpty) {
      return 'success';
    }
    return 'alreadyExist';
  }

  Future<Status> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        user.sendEmailVerification();
      } catch (e) {
        return Status.error;
      }
      return Status.success;
    } else {
      return Status.alreadyVerified;
    }
  }
}
