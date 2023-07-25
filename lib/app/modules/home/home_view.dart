import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/home_controller.dart';
import 'package:myapp/app/modules/homepage/homepage_view.dart';
import 'package:myapp/app/modules/livepage/livepage_view.dart';
import 'package:myapp/app/modules/mypage/mypage_view.dart';
import 'package:myapp/app/modules/stockpage/stockpage_view.dart';
import 'package:myapp/app/modules/trade/trade_view.dart';


class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List<Widget> bodyPageList = [
    HomepageView(),
    StockpageView(),
    TradeView(),
    LivepageView(),
    MypageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "新闻首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "股票跟踪"),
              BottomNavigationBarItem(icon: Icon(Icons.transgender), label: "交易记录"),
              BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "导师讲课"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的信息"),
            ],
          )),
    );
  }
}
