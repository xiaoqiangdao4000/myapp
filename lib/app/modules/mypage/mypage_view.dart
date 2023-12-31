import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/mypage/mypage_controller.dart';

class MypageView extends GetView<MypageController> {
  const MypageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的信息'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '我的信息 is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
