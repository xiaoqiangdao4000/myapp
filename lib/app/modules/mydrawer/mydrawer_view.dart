import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class MydrawerView extends GetView {
  const MydrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var drawer_width = MediaQuery.of(context).size.width;
    return Drawer(
      elevation: 30,
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认的空白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  color: Colors.blue,
                  width: 2000,
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 0),
                        child: ClipOval(
                          child: Image.asset(
                            "images/head1.jpg",
                            width: 80,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 190,
                        child: Text(
                          "仙仙妹妹",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )),
            createDivider(5),
            //交易明细、个性化设置、账号与安全、帮助中心，关于
            createListTitle(Icons.person, '个人信息', () {
              Get.defaultDialog(title: '提示', middleText: '个人信息');
            }),
            createDivider(15),
            createListTitle(Icons.currency_exchange, '交易明细', () {
              Get.defaultDialog(title: '提示', middleText: '交易明细');
            }),
            createDivider(15),
            createListTitle(Icons.security, '账号与安全', () {
              Get.defaultDialog(title: '提示', middleText: '账号与安全');
            }),
            createDivider(15),
            createListTitle(Icons.help_center, '帮助中心', () {
              Get.defaultDialog(title: '提示', middleText: '帮助中心');
            }),
            createDivider(15),
            createListTitle(Icons.phone, '关于', () {
              Get.defaultDialog(title: '提示', middleText: '关于');
            }),
            createDivider(15),
            logoutBtn(),
          ],
        ),
      ),
    );
  }

//创建listtitle
  Widget createListTitle(IconData iconData, String name, Function callback) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: ListTile(
        leading: Icon(iconData, size: 40),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          callback();
        },
      ),
    );
  }

  //创建分割线
  Widget createDivider(double height) {
    return Divider(
      height: height,
      color: Colors.grey,
    );
  }

  //退出登陆按钮
  Widget logoutBtn() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 250, 100, 0),
      child: TextButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          child: const Text(
            '退出登陆',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )),
    );
  }
}
