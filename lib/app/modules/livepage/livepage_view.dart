import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/livepage/livepage_controller.dart';



class LivepageView extends GetView<LivepageController> {
  const LivepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导师讲课'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '导师讲课，同学们开客了，都来学习吧',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
