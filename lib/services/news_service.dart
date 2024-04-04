import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter_hammer/models/newsData.dart';


class NewsService {
  final Dio _dio;

  NewsService(this._dio);

  Future<NewsData> fetchNewsData() async {
    try {
    

  // 设置请求头
  // _dio.options.headers['Access-Control-Allow-Origin'] = '*';
  // _dio.options.headers['Content-Type'] = 'application/json';

      Response response = await _dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=71da63ca6498413c9b5f8f319d75e149');
      // print('ddd新闻===$response');
      if (response.statusCode == 200) {
        final jsonData = response.data;
        print('jsonData$jsonData');
         return NewsData.fromJson(jsonData);
      } else {
        throw Exception('Failed to load group data');
      }
    } catch (e) {
      throw Exception('Failed to load group data: $e');
    }
  }

  
}
