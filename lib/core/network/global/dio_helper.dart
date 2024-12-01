import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/lcoal/sharedpref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/v2/",
        receiveDataWhenStatusError: true,
        headers: {
          'Authorization': 'Bearer ${SharedprefHelper.getData(key: "token")}',
          "lang": "ar"
        }));

    dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }

  static Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(
      endpoint,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await dio!.post(endpoint, data: data);
  }
}
