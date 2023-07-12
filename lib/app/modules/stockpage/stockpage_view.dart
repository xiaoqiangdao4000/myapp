import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/stockpage/stockpage_controller.dart';

class StockpageView extends GetView<StockpageController> {
  const StockpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StockpageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StockpageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
