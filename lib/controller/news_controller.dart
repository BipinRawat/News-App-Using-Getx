import 'package:get/get.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/networking/news_networking.dart';

class NewsController extends GetxController {
  var newsList = List<Article>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  void getNews() async {
    var news = await ApiService().getNews(Get.arguments);


    try {
      if (news != null) {
        newsList.addAll(news.articles);
      }
    }
    finally {
      isLoading(false);
    }
  }
}