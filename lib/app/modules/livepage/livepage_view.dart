import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/livepage/livepage_controller.dart';



class LivepageView extends GetView<LivepageController> {
  const LivepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LivepageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LivepageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
