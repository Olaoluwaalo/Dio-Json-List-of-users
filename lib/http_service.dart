import 'package:dio/dio.dart';
import 'package:dio_json_list_of_users/list_users.dart';

class HttpService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/"));

  Future<UserData> fetchData() async {
    final response = await _dio.get('https://reqres.in/api/users?page=2');
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      return UserData.fromJson(responseData);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
