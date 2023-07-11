import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo(),
              logoName(),
              userNameEdit(),
              passwordEdit(),
              registerBtn(),
              backLogin(),
            ]),
      ),
    );
  }

//logo
  Widget logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0),
      child: Image.asset(
        'images/logo.png',
        width: 100,
        height: 83,
      ),
    );
  }

//logo名字
  Widget logoName() {
    return const Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Text(
        '超级Demo',
        style: TextStyle(
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
        decoration: const InputDecoration(
          labelText: '用户名',
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
        decoration: const InputDecoration(
          labelText: '密码',
        ),
        obscureText: true,
        // focusNode: _passwordFocusNode,
      ),
    );
  }

  //注册按钮
  Widget registerBtn() {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size(300, 45)),
          onPressed: () {
            controller.onRegister();
          },
          child: const Text(
            "注册用户",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ));
  }

  //返回登陆
  Widget backLogin() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        child: const Text(
          "返回登陆",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        onPressed: () {
          controller.onBackLogin();
        },
      ),
    );
  }
}
