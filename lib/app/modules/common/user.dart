import 'dart:convert';

import 'package:myapp/app/modules/common/global.dart';

class User {
  String username = '';
  String password = '';
  int islogin = 0;
  int theme = 0;
  int language = 1;
  String zhNews = '';
  String enNews = '';
  String vnNews = '';
  String zhStocks = '';
  String enStocks = '';
  String vnStocks = '';
  String myStocks = '';
  String trade = '';
  User._internal();

  factory User() => _instance;

  static final User _instance = User._internal();

  //设置用户名
  setUserName(String data) {
    username = data;
    Global.g_shared.setString("username", username);
  }

  //获取用户名
  getUserName() {
    username = Global.g_shared.getString('username') ?? '';
    return username;
  }

  //设置密码
  setPassword(String data) {
    password = data;
    Global.g_shared.setString("password", password);
  }

  //获取密码
  getPassword() {
    password = Global.g_shared.getString('password') ?? '';
    return password;
  }

  //获取语言
  getLanguage() {
    language = Global.g_shared.getInt('language') ?? 1;
    return language;
  }

  //设置语言
  setLanguage(int data) {
    language = data;
    Global.g_shared.setInt("language", language);
  }

  //设置中国新闻
  setZhNews(String data) {
    zhNews = data;
    Global.g_shared.setString("zhNews", zhNews);
  }

  //设置英文新闻
  setEnNews(String data) {
    enNews = data;
    Global.g_shared.setString("enNews", enNews);
  }

  //设置越南新闻
  setVnNews(String data) {
    vnNews = data;
    Global.g_shared.setString("vnNews", vnNews);
  }

  //获取中国新闻
  String getZhNews() {
    zhNews = Global.g_shared.getString('zhNews') ?? '';
    return zhNews;
  }

  //获取英文新闻
  String getEnNews() {
    enNews = Global.g_shared.getString('enNews') ?? '';
    return enNews;
  }

  //获取越南新闻
  String getVnNews() {
    vnNews = Global.g_shared.getString('vnNews') ?? '';
    return vnNews;
  }

  getUserInfo() {
    getLanguage();
    getUserName();
    getPassword();
    getEnNews();
    getZhNews();
    getVnNews();
  }
}
