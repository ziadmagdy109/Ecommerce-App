import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/strings.dart';

class CharacterService {
  late Dio dio;
  CharacterService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      final data = response.data["results"];
      return data;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
