import 'package:get/get.dart';
import 'package:myapp/app/modules/mypage/mypage_controller.dart';

class MypageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MypageController>(
      () => MypageController(),
    );
  }
}
