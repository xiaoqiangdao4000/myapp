import 'package:get/get.dart';

import 'livepage_controller.dart';

class LivepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LivepageController>(
      () => LivepageController(),
    );
  }
}
