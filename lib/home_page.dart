import 'dart:developer';

import 'package:dio_json_list_of_users/http_service.dart';
import 'package:dio_json_list_of_users/list_of_users_tile.dart';
import 'package:dio_json_list_of_users/list_users.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService _httpService = HttpService();
  UserData? _userData;

  void _loadData() async {
    try {
      final user = await _httpService.fetchData();
      setState(() {
        _userData = user;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserListWidget(
      users: _userData!.data,
    );
  }
}
