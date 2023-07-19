import 'dart:convert';
import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/util/constants.dart';
import 'package:dio/dio.dart';

class HomepageController extends GetxController {
  var refreshCount = 10.obs;
  late EasyRefreshController refreshController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var lastoneId = 0;
  var lastoneIdStart = 0;
  var lastoneIdEnd = 0;
  var hasNextPage = true;
  var isSuccessful = true;
  var startIndex = 0;
  var endIndex = 10;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    print('初始化HomepageController');
    getDatas(requestStart);
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  getDatas(int requestType) async {
    if (requestType == requestRefresh) {
      startIndex = 0;
      endIndex = 10;
    }

    String url =
        "https://3g.163.com/touch/reconstruct/article/list/BBM54PGAwangning/$startIndex-$endIndex.html";
    print("开始请求数据url:" + url);
    var response = await Dio().get(url);
    String responseStr = response.data;
    if (responseStr.isNotEmpty) {
      var jsonString = responseStr.substring("artiList(".length, responseStr.length - 1);
      
      Map<String, dynamic> responseJson =  json.decode(jsonString);
      print("请求后的jsonString:" + responseJson.toString());
      // DealDatas(responseJson, request_type);
      startIndex = endIndex + 1;
      endIndex = startIndex + 9;
      // return 'sss';
    } else {
      Fluttertoast.showToast(
          msg: "已经没有新数据了",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
    //  return 'sssss';
  }
}
