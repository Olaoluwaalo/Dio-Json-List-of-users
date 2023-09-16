import 'package:dio_json_list_of_users/list_users.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final List<User> users;

  const UserListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('User Data'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text('Email: ${user.email}'),
          );
        },
      ),
    );
  }
}
