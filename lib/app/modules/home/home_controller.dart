//import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var bottomBarIndex = 0.obs;
  changeBottomBarIndex(int index) {
    bottomBarIndex.value = index;
  }

}
