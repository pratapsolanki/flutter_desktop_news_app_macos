import 'package:get/get.dart';

import '../../../models/news_page.dart';
import '../../../network_module/network_module.dart';

class NewsListController extends GetxController {
  var isLoading = true.obs;
  var newsList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getNewsList(NewsPage newsPage) async {
    try {
      isLoading(true);
      var appsList = await  ApiServices().fetchArticles(newsPage.category);
      newsList.assignAll(appsList);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
