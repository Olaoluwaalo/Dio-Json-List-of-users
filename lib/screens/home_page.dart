import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_json_list_of_users/models/list_of_users.dart';
import 'package:dio_json_list_of_users/models/user.dart';
import 'package:dio_json_list_of_users/services/http_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HttpService _httpService;
  late List<User> users;
  late ListOfUsers listOfUsers;
  late Response response;
  bool isLoading = false;

  @override
  void initState() {
    _httpService = HttpService();
    listOfUsers = ListOfUsers(users);
    super.initState();
  }

  @override
  void dispose() {
    _httpService;
    super.dispose();
  }

  Future getListOfUsers() async {
    try {
      isLoading = true;
      response = await _httpService.getRequest("/api/users?page=2");
      isLoading = false;
    } on Exception catch (e) {
      log(e.toString());
    }
    if (response.statusCode == 200) {
      setState(() {
        listOfUsers = ListOfUsers.fromJson(response.data);
        users = listOfUsers.users;
      });
    } else {
      isLoading = true;
      log('An error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'List of users',
          ),
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.firstName),
                    leading: Image.network(user.avatar),
                    subtitle: Text(user.email),
                  );
                },
                itemCount: users.length,
              ));
  }
}
