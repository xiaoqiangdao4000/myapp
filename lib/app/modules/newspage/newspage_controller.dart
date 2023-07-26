import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/common/user.dart';
import 'package:myapp/app/modules/newspage/wynews_mode.dart';
import 'package:myapp/app/modules/util/constants.dart';
import 'package:dio/dio.dart';

class NewspageController extends GetxController {
  var refreshCount = 10.obs;
  late EasyRefreshController refreshController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var lastoneId = 0;
  var lastoneIdStart = 0;
  var lastoneIdEnd = 0;
  var hasNextPage = true;
  var isSuccessful = true.obs;
  var startIndex = 0;
  var endIndex = 10;
  List<dynamic> listData = [].obs;

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

    //有数据
    if (responseStr.isNotEmpty) {
      String jsonString =
          responseStr.substring("artiList(".length, responseStr.length - 1);
      dealDatas(jsonString, requestType);
      startIndex = endIndex + 1;
      endIndex = startIndex + 9;
    } else {
      //没有更多数据
      Fluttertoast.showToast(
          msg: "已经没有新数据了",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
  }

  //处理请求到的数据
  void dealDatas(jsonString, int requestType) {
    try {
      User user = User();
      //转换为模型
      WynewsMode responseJson = wynewsModeFromJson(jsonString);

      //刷新数据
      if (requestType == requestRefresh) {
        listData.clear();
        for (var i = 0; i < responseJson.bbm54PgAwangning.length; i++) {
          listData.add(responseJson.bbm54PgAwangning[i]);
        }
        //保存新闻数据
        user.setZhNews(jsonString);

        Fluttertoast.showToast(
            msg: "刷新成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      } else {
        //加载更多
        for (var i = 0; i < responseJson.bbm54PgAwangning.length; i++) {
          listData.add(responseJson.bbm54PgAwangning[i]);
        }
        //保存新闻数据
        user.setZhNews(jsonString);
      }
    } catch (e) {
      isSuccessful.value = false;
      print("异常==》" + e.toString());
    }
  }
}
