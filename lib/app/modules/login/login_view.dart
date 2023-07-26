import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo(),
              logoName(),
              userNameEdit(),
              passwordEdit(),
              logoBtn(),
              forgotPassword(),
              register(),
              downBtn(),
            ]),
      ),
    );
  }

  // //语言按钮
  // Widget languageBtn() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 0.0),
  //     child: ElevatedButton.icon(
  //       icon: const Icon(Icons.language),
  //       label: const Text("语言"),
  //       onPressed: () {
  //       //  downBtn();
  //       },
  //     ),
  //   );
  // }

  //下拉按钮
  Widget downBtn() {
    return Obx(() => DropdownButton(
        value: controller.dropDownBtnView.value,
        icon: const Icon(Icons.language),
        iconSize: 25,
        iconEnabledColor: Colors.blue,
        isExpanded: false,
        hint:  Text(
          'switchlanguage'.tr,
          style:const TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        items: const [
          DropdownMenuItem(value: 1, child: Text('中文')),
          DropdownMenuItem(value: 2, child: Text('English')),
          DropdownMenuItem(value: 3, child: Text('Tiếng Việt')),
        ],
        onChanged: (value) {
          controller.onchangeBtnValue(value);
        }));
  }

//logo
  Widget logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: Image.asset(
        'images/logo.png',
        width: 100,
        height: 83,
      ),
    );
  }

//logo名字
  Widget logoName() {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Text(
        'appName'.tr,
        style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue),
      ),
    );
  }

//用户名输入框
  Widget userNameEdit() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 35.0, right: 35.0),
      child: TextField(
        controller: controller.usernameController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'username'.tr,
        ),
        // onEditingComplete: () =>
        //    FocusScope.of(context).requestFocus(_passwordFocusNode),
      ),
    );
  }

//密码输入框
  Widget passwordEdit() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 35.0, right: 35.0),
      child: TextField(
        controller: controller.passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'password'.tr,
        ),
        obscureText: true,
        // focusNode: _passwordFocusNode,
      ),
    );
  }

  //登陆按钮
  Widget logoBtn() {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size(300, 45)),
          onPressed: () {
            controller.onlogin();
          },
          child: Text(
            "login".tr,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ));
  }

  //忘记密码
  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        child: Text(
          "forgot_password".tr,
        ),
        onPressed: () {},
      ),
    );
  }

  //注册
  Widget register() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        child: Text(
          "register".tr,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
        onPressed: () {
          controller.onRegister();
        },
      ),
    );
  }
}
