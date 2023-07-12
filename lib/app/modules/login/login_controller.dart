import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  var dropDownBtnView = 1.obs;

  onchangeBtnValue(value) {
    dropDownBtnView.value = value;
    update();
  }

  onlogin() {
    var username = usernameController.text.trim();
    var password = passwordController.text.trim();

    if (username.isEmpty) {
      Get.defaultDialog(
        title: '提示',
        middleText: '用户名不能为空！',
      );
      return;
    }
    if (password.isEmpty) {
      Get.defaultDialog(title: '提示', middleText: '密码不能为空！');
      return;
    }

    Get.offNamed(Routes.home);
  }

  onRegister() {
    Get.offNamed(Routes.register);
  }
}
