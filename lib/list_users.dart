class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UserData {
  final List<User> data;

  UserData({required this.data});

  factory UserData.fromJson(Map<String, dynamic> json) {
    List<User> userList = (json['data'] as List).map((userData) {
      return User.fromJson(userData);
    }).toList();

    return UserData(data: userList);
  }
}
