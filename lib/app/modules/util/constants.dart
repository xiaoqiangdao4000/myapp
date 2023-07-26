//开始请求
import 'package:easy_refresh/easy_refresh.dart';

const int requestStart = 000001;
// 刷新请求
const int requestRefresh = 000002;
// 加载更多请求
const int requestLoadMore = 000003;

const String languageChinese = 'zh_CN';
const String languageEnglish = 'en_US';
const String languageVueNan = 'vi_VN';

ClassicHeader getClassicHeader() {
  return const ClassicHeader(
    dragText: '下拉刷新数据',
    armedText: '松手刷新数据',
    readyText: '正在获取数据',
    processingText: '正在获取数据',
    processedText: '刷新成功！',
    noMoreText: '没有更多数据了',
    messageText: '最后更新时间: %T',
    failedText: '刷新数据失败',
  );
}

ClassicFooter getClassicFooter() {
  return const ClassicFooter(
      readyText: '正在加载数据',
      processingText: '正在加载数据',
      processedText: '数据加载成功',
      noMoreText: '没有更多数据了',
      messageText: '最后更新时间: %T',
      failedText: '加载数据失败');
}
