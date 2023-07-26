import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {'appName': '超级视频',     'hello': "你好"},
        'en_US': {'appName': 'Super Demo', 'hello': 'hello'},
        'vi_VN': {'appName': 'siêu video', 'hello': 'hello'}
      };
}
