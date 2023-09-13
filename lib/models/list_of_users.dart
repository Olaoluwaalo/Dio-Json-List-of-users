import 'package:dio_json_list_of_users/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_of_users.g.dart';

@JsonSerializable()
class ListOfUsers {
  @JsonKey(name: "data")
  final List<User> users;

  ListOfUsers(this.users);

  factory ListOfUsers.fromJson(Map<String, dynamic> json) =>
      _$ListOfUsersFromJson(json);

  /// Connect the generated [_$ListOfUsersToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ListOfUsersToJson(this);
}
