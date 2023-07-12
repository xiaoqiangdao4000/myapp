import 'package:get/get.dart';
import 'package:myapp/app/modules/stockpage/stockpage_controller.dart';

class StockpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockpageController>(
      () => StockpageController(),
    );
  }
}
