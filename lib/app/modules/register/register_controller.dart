import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/common/global.dart';
import 'package:myapp/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

//注册按钮
  onRegister() {
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
    Global.g_user.setUserName(username);
    Global.g_user.setPassword(password);
    Get.offNamed(Routes.home);
  }

//返回登陆
  onBackLogin() {
    Get.offNamed(Routes.login);
  }
}
