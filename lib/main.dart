import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: '超级视频',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
       theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset:false,
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
    )
  );
}
