import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../mydrawer/mydrawer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '超级Demo',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            controller.openDrawer();
          },
        ),
      ),
      key: controller.scaffoldKey,
      drawer: const MydrawerView(),
    );
  }
}
