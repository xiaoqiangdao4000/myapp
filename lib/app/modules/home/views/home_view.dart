import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../mydrawer/mydrawer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  int _currentIndex = 0;
  List<Widget> bodyPageList = [
    Center(
      child: Text("tab1"),
    ),
    Center(
      child: Text("tab2"),
    ),
  ];

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
      body: Obx(() => bodyPageList[controller.bottomBarIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            // 当前菜单下标
            currentIndex: controller.bottomBarIndex.value,
            // 点击事件,获取当前点击的标签下标
            onTap: (int index) {
              controller.changeBottomBarIndex(index);
            },
            iconSize: 30.0,
            fixedColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "股票"),
              BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "视频"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
            ],
          )),
    );
  }
}
