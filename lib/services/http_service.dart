import 'package:dio/dio.dart';

class HttpService {
  Dio dio;

  final baseUrl = "https://reqres.in/";

  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }
}
