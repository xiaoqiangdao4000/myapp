import 'dart:convert';

import 'package:myapp/app/modules/common/global.dart';

UserInfoMode userInfoFromJson(String str) =>
    UserInfoMode.fromJson(json.decode(str));
String userInfoToJson(UserInfoMode data) => json.encode(data.toJson());

class UserInfoMode {
  String username;
  String password;
  int islogin;
  int theme;
  String language;
  String zhNews;
  String enNews;
  String vnNews;
  String zhStocks;
  String enStocks;
  String vnStocks;
  String myStocks;
  String trade;

  UserInfoMode({
    required this.username,
    required this.password,
    required this.islogin,
    required this.theme,
    required this.language,
    required this.zhNews,
    required this.enNews,
    required this.vnNews,
    required this.zhStocks,
    required this.enStocks,
    required this.vnStocks,
    required this.myStocks,
    required this.trade,
  });

  factory UserInfoMode.fromJson(Map<String, dynamic> json) => UserInfoMode(
        username: json["username"],
        password: json["password"],
        islogin: json["islogin"],
        theme: json["theme"],
        language: json["language"],
        zhNews: json["zh_news"],
        enNews: json["en_news"],
        vnNews: json["vn_news"],
        zhStocks: json["zh_stocks"],
        enStocks: json["en_stocks"],
        vnStocks: json["vn_stocks"],
        myStocks: json["my_stocks"],
        trade: json["trade"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "islogin": islogin,
        "theme": theme,
        "language": language,
        "zh_news": zhNews,
        "en_news": enNews,
        "vn_news": vnNews,
        "zh_stocks": zhStocks,
        "en_stocks": enStocks,
        "vn_stocks": vnStocks,
        "my_stocks": myStocks,
        "trade": trade,
      };
}

class User {
  String username = '';
  String password = '';
  int islogin = 0;
  int theme = 0;
  String language = '';
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
    language = Global.g_shared.getString('language') ?? '';
    return language;
  }

  //设置语言
  setLanguage(String data) {
    language = data;
    Global.g_shared.setString("language", language);
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
