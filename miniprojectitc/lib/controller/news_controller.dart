import 'package:get/get.dart';
import 'package:miniprojectitc/model/news_model.dart';
import 'package:miniprojectitc/service/news_service.dart';

class NewsController extends GetxController {
  List<NewsModel> news = [];
  List<String?> carouselImages = [];
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNews(); 
  }

  void fetchNews() async {
  try {
    isLoading = true;
    update();
    
    // Ambil data berita dari API
    news = await NewsService().fetchNews();
    
    // Ambil URL gambar untuk carousel
    carouselImages = news
        .map((news) => news.urlToImage)
        .where((image) => image != null)
        .toList();

    isLoading = false;
    update();
  } catch (e) {
    isLoading = false;
    update();
    print(e);
  }
}


}