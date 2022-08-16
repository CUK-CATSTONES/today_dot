import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';

class SignUpController extends GetxController {
  String email = '';
  String pwd = '';
  String name = '';

  bool isDuplicateID = false;
  bool isDuplicatePWD = false;
  bool isEmailCorrected = false;

  /// 2. validator 하나씩만 되게끔

  /// email을 입력하고 중복확인 버튼을 눌렀을때
  // Future checkDuplicatedID() async {
  //   await AuthRepository.id(id: email).checkEmailExist().then(
  //     (value) {
  //       print('---');
  //       print(value);

  //       switch (value) {
  //         case 'success':
  //           isDuplicateID = false; //중복되지 않음
  //           Get.snackbar('사용가능!', '사용 가능한 아이디 입니다.');
  //           break;
  //         case 'alreadyExist':
  //           isDuplicateID = true; //중복됨
  //           Get.snackbar('사용불가', '이미 동일한 아이디가 존재합니다!!');
  //           break;
  //         case 'invalid-email':
  //           Get.snackbar('invalid', 'invalid-email');
  //           break;
  //         default:
  //           isDuplicateID = true;
  //           break;
  //       }
  //     },
  //   );
  // }

  Future signUp(Map<String, dynamic> map) async {
    AuthRepository.idAndpwd(id: map['id'], pwd: map['pwd'])
        .signUp()
        .then((value) {
      print('48 $value');
      switch (value) {
        case Status.emailAlreadyExist:
          Get.back();
          Get.snackbar('회원가입 불가', '이미 가입된 계정이 있습니다.');
          break;
        case Status.error:
          Get.back();
          Get.snackbar('회원가입 불가', '오류가 발생하였습니다.');
          break;
        case Status.success:
          Get.offAllNamed('/home');
          Get.snackbar('회원가입 완료', '회원가입을 축하드려요:>');
          break;

        default:
          Get.back();
          Get.snackbar('회원가입 불가', '다시 시도해주세요');
          break;
      }
    });
  }
}
