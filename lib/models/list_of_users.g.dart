// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfUsers _$ListOfUsersFromJson(Map<String, dynamic> json) => ListOfUsers(
      (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOfUsersToJson(ListOfUsers instance) =>
    <String, dynamic>{
      'data': instance.users,
    };
