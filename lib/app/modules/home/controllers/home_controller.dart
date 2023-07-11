import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var bottomBarIndex = 0.obs;

 void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  changeBottomBarIndex(int index) {
    bottomBarIndex.value = index;
    print( bottomBarIndex.value);
  }

}
