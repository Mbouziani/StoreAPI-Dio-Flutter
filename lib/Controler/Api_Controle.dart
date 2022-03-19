// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:demofashionapp/Model/Article_Model.dart';
import 'package:dio/dio.dart';

class ApiControl {
  var dio = Dio();

  static Future<List<Article>> fetchArticle() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  static Future<List<Article>> fetchArticleByCategorie(
      String categoriename) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoriename');
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  static Future<Article> fetchArticleByID(int aricle_ID) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/$aricle_ID');
    Article _article = Article.fromJson(response.data);
    return _article;
  }
}
