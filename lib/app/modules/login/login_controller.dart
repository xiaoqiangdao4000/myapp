import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/common/global.dart';
import 'package:myapp/app/modules/common/language_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  LanguageController messagesController = Get.put(LanguageController());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  var dropDownBtnView = 1.obs;

  @override
  void onInit() {
    super.onInit();

    //语言配置
    var language = Global.g_user.getLanguage();
    if (language == 1) //中文
    {
      dropDownBtnView.value = 1;
      messagesController.changeLanguage('zh', "CN");
    } else if (language == 2) //英文
    {
      dropDownBtnView.value = 2;
      messagesController.changeLanguage('en', "US");
    } else if (language == 3) //越南语
    {
      dropDownBtnView.value = 3;
      messagesController.changeLanguage('vi', "VN");
    }

    //初始化用户账户
    String username = Global.g_user.getUserName();
    String password = Global.g_user.getPassword();
    if (username.isNotEmpty) {
      usernameController.text = username;
    }
    if (password.isNotEmpty) {
      passwordController.text = password;
    }
  }

  onchangeBtnValue(value) {
    dropDownBtnView.value = value;
    if (value == 1) //中文
    {
      messagesController.changeLanguage('zh', "CN");
      Global.g_user.setLanguage(1);
    } else if (value == 2) //英文
    {
      messagesController.changeLanguage('en', "US");
      Global.g_user.setLanguage(2);
    } else if (value == 3) //越南语
    {
      messagesController.changeLanguage('vi', "VN");
      Global.g_user.setLanguage(3);
    }

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

    Global.g_user.setUserName(username);
    Global.g_user.setPassword(password);

    Get.offNamed(Routes.home);
  }

  onRegister() {
    Get.offNamed(Routes.register);
  }
}
