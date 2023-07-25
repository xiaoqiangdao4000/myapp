import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/trade/trade_controller.dart';

class TradeView extends GetView<TradeController> {
  const TradeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交易记录'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '交易记录 is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
