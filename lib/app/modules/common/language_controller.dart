import 'dart:ui';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
