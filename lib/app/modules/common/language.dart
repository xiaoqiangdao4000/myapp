import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'appName': '超级视频',
          'username': "用户名",
          'password': '密码',
          'login':'登录',
          'forgot_password':'忘记密码？',
          'register':'注册',
          'register_account':'注册用户',
          'back_login':'返回登陆',
          'switchlanguage':'切换语言',
        },
        'en_US': {
          'appName': 'Super Demo',
          'username': 'UserName',
          'password': 'PassWord',
          'login':'Login',
          'forgot_password':'Forgot password',
          'register':'Register',
          'register_account':'Register',
          'back_login':'Back Login',
          'switchlanguage':'Language',
        },
        'vi_VN': {
          'appName': 'siêu video',
          'username': 'tên tài khoản',
          'password': 'mật khẩu',
          'login':'Đăng nhập',
          'forgot_password':'quên mật khẩu',
          'register':'đăng ký',
          'register_account':'đăng ký',
          'back_login':'đăng nhập lại',
          'switchlanguage':'ngôn ngữ',
        }
      };
}
