import 'package:get/get.dart';
import 'package:myapp/app/modules/trade/trade_controller.dart';

class TradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeController>(
      () => TradeController(),
    );
  }
}
