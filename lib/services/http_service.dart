import 'package:dio/dio.dart';
import 'dart:developer' show log;

class HttpService {
  //get an instance of a Dio add from pub.dev
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://reqres.in/",
    ),
  );
  HttpService();

//create a function to getRequest

  Future<Response> getRequest(endpoint) async {
    Response response;
    try {
      response = await _dio.get(endpoint);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
      throw Exception();
    }
    return response;
  }

//Allows to get interceptors
  void interceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        log(e.message.toString());
        //This communicates the error encountered while consuming Api
      },
      onRequest: (options, handler) {
        log(options.data());
        // Listen to changes while making a request
      },
      onResponse: (e, handler) {
        log(e.data.toString());
        // Listens to response gotten from Api call
      },
    ));
  }
}
