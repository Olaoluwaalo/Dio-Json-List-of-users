import 'package:dio_json_list_of_users/model/user.dart';

import 'package:json_annotation/json_annotation.dart';
part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  @JsonKey(name: "data")
  final User user;

  SingleUserResponse({required this.user});

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleUserResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}
