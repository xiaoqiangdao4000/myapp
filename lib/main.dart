import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/common/global.dart';
import 'package:myapp/app/modules/common/language.dart';
import 'package:myapp/app/routes/app_pages.dart';

void main() => Global.init().then((e) => runApp(GetMaterialApp(
      title: '超级视频',
      translations: Language(),
      locale: const Locale('zh', 'CN'), //设置默认语言
      fallbackLocale:const Locale("zh", "CN"), // 在配置错误的情况下,使用的语言
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: child,
        ),
      ),
    )));

// void main() {
//   await Global.init();

// }
