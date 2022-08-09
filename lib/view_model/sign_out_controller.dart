import 'package:get/get.dart';
import 'package:today_dot/model/asset/status.dart';
import 'package:today_dot/model/repository/auth_repository.dart';

class SignOutController extends GetxController {
  late Status status;
  Future signOut() async {
    if (status != Status.signOut) {
      AuthRepository().signOut().then((result) {
        print(result);
        Get.back(); // Indicator Off
        Get.snackbar('로그아웃 실패😨', '로그아웃에 실패했습니다.');
      });
    } else {
      Get.snackbar('로그아웃 완료!', '로그아웃되었습니다.');
      Get.offAllNamed('/');
    }
  }
}
