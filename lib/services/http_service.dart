import 'dart:developer';

import 'package:dio/dio.dart';

class HttpService {
  Dio dio;
  HttpService()
      : dio = Dio(
          BaseOptions(baseUrl: "https://reqres.in/"),
        );

  Future<Response> getRequest(endPoint) async {
    Response response;
    try {
      response = await dio.get(endPoint);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
      throw Exception();
    }

    return response;
  }
}
