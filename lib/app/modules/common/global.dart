// 提供五套可选主题色

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/app/modules/common/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static late SharedPreferences g_shared;

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  //用户数据
  static late User g_user;
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    //初始化数据持久化工具
    g_shared = await SharedPreferences.getInstance();

    //获取用户信息
    g_user = User();
    g_user.getUserInfo();
  }
}
