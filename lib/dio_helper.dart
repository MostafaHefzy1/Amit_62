import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/v2/", receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(endpoint, queryParameters: queryParameters);
  }

  static Future<Response> postData(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await dio!.post(endpoint, data: data);
  }
}
