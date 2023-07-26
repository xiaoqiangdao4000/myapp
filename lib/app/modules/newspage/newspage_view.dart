import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/newspage/wynews_mode.dart';
import 'package:myapp/app/modules/mydrawer/mydrawer_view.dart';
import '../util/constants.dart';
import 'newspage_controller.dart';

class NewspageView extends GetView {
  NewspageView({Key? key}) : super(key: key);

  final homepageController = Get.put(NewspageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '新闻首页',
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
      body: Center(
        //padding: const EdgeInsets.only(top: 100.0),
        child: Obx(() => getBody(context)),
      ),
    );
  }

  getBody(BuildContext context) {
    if (homepageController.isSuccessful.value == true) {
      if (homepageController.listData.isEmpty) {
        // 加载菊花
        return const CircularProgressIndicator();
      } else {
        return EasyRefresh(
          controller: homepageController.refreshController,
          header: getClassicHeader(),
          footer: getClassicFooter(),
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
          child: ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return getItem(position);
            },
            itemCount: homepageController
                .listData.length, // homepageController.refreshCount.value,
          ),
        );
      }
    } else {
      EasyRefresh(
        controller: homepageController.refreshController,
        header: getClassicHeader(),
        footer: getClassicFooter(),
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
        child: const Center(
          child:
              Text("异常", style: TextStyle(fontSize: 40.0, color: Colors.black)),
        ),
      );
    }
  }

  //列表item
  Widget getItem(int i) {
    Bbm54PgAwangning data = homepageController.listData[i] as Bbm54PgAwangning;
    //String type = homepageController.listData[i];
    // if ("main" == type) {
    String articleTitle = data.title;
    String timeStr = data.ptime.toString();
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, //纵向对齐方式：起始边对齐
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100.0,
                      child: getImage(data.imgsrc),
                      alignment: FractionalOffset.center,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              articleTitle,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            alignment: FractionalOffset.topLeft,
                          ),
                          Container(
                            child: Text("${data.digest}",
                                style: TextStyle(fontSize: 16.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            alignment: Alignment.topLeft,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: Text("${data.source}",
                                        style: TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomLeft,
                                  ),
                                  Container(
                                    child: Text(timeStr,
                                        style: TextStyle(fontSize: 10.0)),
                                    alignment: FractionalOffset.bottomRight,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
              const Divider(), //分割线
            ],
          ),
        ),
        onTap: () {
          onItemClick(i, articleTitle);
        });

    // else
    // {
    //   print("加载底线");
    //   return new Container(
    //     height: 50.0,
    //     child: new Text(
    //       "——   我也是有底线的   ——",
    //       style: new TextStyle(fontSize: 16.0, color: Colors.black38),
    //     ),
    //     alignment: FractionalOffset.center,
    //   );
    // }
  }

//列表中图片加载
  getImage(String imgUrl) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  //列表点击
  void onItemClick(int i, String articleTitle) {
    print('点击列表');
//     String h5_url = (listData[i].data as BBM54PGAwangning).url;
//     String title= (listData[i].data as BBM54PGAwangning).title;
//     Navigator.push(
//         context,
//         new MaterialPageRoute(
// //            builder: (context) => new NewsWebPage(h5_url,'新闻详情')));
//             builder: (context) => new NewsWebPage(h5_url,title)));
  }
}
