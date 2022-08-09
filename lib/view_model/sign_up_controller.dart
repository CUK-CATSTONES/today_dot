import 'package:get/get.dart';
import 'package:today_dot/model/repository/auth_repository.dart';

class SignUpController extends GetxController {
  late String email;
  late String pwd;
  late String confirmPWD;
  late String name;

  bool isDuplicateID = false;
  bool isDuplicatePWD = false;
  bool isEmailCorrected = false;

  /// 2. validator 하나씩만 되게끔

  /// email을 입력하고 중복확인 버튼을 눌렀을때
  Future checkID() async {
    await AuthRepository.id(id: email).checkEmailExist().then(
      (result) {
        print(result);
        switch (result) {
          case 'success':
            isDuplicateID = false;
            Get.snackbar('사용가능!', '사용 가능한 아이디 입니다.');
            break;
          case 'alreadyExist':
            isDuplicateID = true;
            Get.snackbar('사용불가', '이미 동일한 아이디가 존재합니다.');
            break;
          default:
            break;
        }
      },
    );
  }
}
