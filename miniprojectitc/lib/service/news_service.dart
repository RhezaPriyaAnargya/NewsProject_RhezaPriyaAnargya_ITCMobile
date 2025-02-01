import 'package:dio/dio.dart';
import 'package:miniprojectitc/model/news_model.dart';

class NewsService {
  Dio dio = Dio();
  
  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await dio.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=31224a17ecea416fbc4a6a03fec090eb');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data['articles'];
      List<NewsModel> news = List.from(data.map((news)=>NewsModel.fromJson(news)));
      return news;
    }
    throw Exception();
    } catch (e) {
      rethrow;
    }
  }

}