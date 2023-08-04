import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/newspage/wynews_mode.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends GetView {
  const NewsWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments as Bbm54PgAwangning;
    print("title:" + data.title);
    print('source:' + data.source);
    print('url:' + data.url);
    print('imgsrc3Gtype:' + data.imgsrc3Gtype);
    print('stitle:' + data.stitle);
    print('digest:' + data.digest);
    print('imgsrc:' + data.imgsrc);

    if (data.url.isEmpty) {
      data.url = 'https://www.163.com';
    }

    WebViewController cc = WebViewController();
    cc.setJavaScriptMode(JavaScriptMode.unrestricted);
    cc.loadRequest(Uri.parse(data.url));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            data.title,
          ),
          centerTitle: true,
        ),
        body: WebViewWidget(
          controller: cc,
        ));
  }
}
