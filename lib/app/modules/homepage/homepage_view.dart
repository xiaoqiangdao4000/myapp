import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/mydrawer/mydrawer_view.dart';
import '../util/constants.dart';
import 'homepage_controller.dart';

class HomepageView extends GetView {
  HomepageView({Key? key}) : super(key: key);

  final homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '主页',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: EasyRefresh(
          controller: homepageController.refreshController,
          header: const ClassicHeader(
            dragText: '下拉刷新数据',
            armedText: '松手刷新数据',
            readyText: '正在获取数据',
            processingText: '正在获取数据',
            processedText: '刷新成功！',
            noMoreText: '没有更多数据了',
            messageText: '最后更新时间: %T',
            failedText: '刷新数据失败',
          ),
          footer: const ClassicFooter(
              readyText: '正在加载数据',
              processingText: '正在加载数据',
              processedText: '数据加载成功',
              noMoreText: '没有更多数据了',
              messageText: '最后更新时间: %T',
              failedText: '加载数据失败'),
          onRefresh: () async {
            await homepageController.getDatas(requestRefresh);
            print('刷新完毕！');
            if (context.mounted) {
              homepageController.refreshCount.value = 10;
              homepageController.refreshController.finishRefresh();
              homepageController.refreshController.resetFooter();
            }
          },
          onLoad: () async {
            await homepageController.getDatas(requestLoadMore);
            print('加载数据完毕！');
            if (context.mounted) {
              homepageController.refreshCount.value += 5;
              homepageController.refreshController.finishLoad(
                  homepageController.refreshCount.value >= 20
                      ? IndicatorResult.noMore
                      : IndicatorResult.success);
            }
          },
          child: Obx(() => ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      child: Text('${index + 1}'),
                    ),
                  );
                },
                itemCount: homepageController.refreshCount.value,
              )),
        ),
      ),
    );
  }
}
