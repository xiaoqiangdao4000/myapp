import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/mydrawer/mydrawer_view.dart';
import 'homepage_controller.dart';

class HomepageView extends GetView {
  HomepageView({Key? key}) : super(key: key);

  final homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主页', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            homepageController.openDrawer();
          },
        ),
      ),
      key: homepageController.scaffoldKey,
      drawer: const MydrawerView(),
      body: const Center(
        child: Text(
          'HomepageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  

}
