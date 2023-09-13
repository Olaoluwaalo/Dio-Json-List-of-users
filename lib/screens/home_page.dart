import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_json_list_of_users/model/single_user_response.dart';
import 'package:dio_json_list_of_users/model/user.dart';
import 'package:dio_json_list_of_users/services/http_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HttpService _service;
  late SingleUserResponse _singleUserResponse;
  late User users;
  bool isLoading = false;
  Future getUser() async {
    Response response;

    try {
      isLoading = true;
      response = await _service.getRequest("/api/users/2");
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          _singleUserResponse = SingleUserResponse.fromJson(response.data);
          users = _singleUserResponse.user;
        });
      } else {
        isLoading = true;
        log("An error occured");
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    _service = HttpService();
    _singleUserResponse = SingleUserResponse(user: users);
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        title: const Text(
          "BLAQMAN'S APP",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Image.network(users.avatar),
                Text(users.firstName),
                Text(users.lastName)
              ],
            ),
    );
  }
}
