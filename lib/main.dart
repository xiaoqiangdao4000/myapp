import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: '超级视频',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    )
  );
}
