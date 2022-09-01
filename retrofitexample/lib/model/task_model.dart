// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  TaskModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

@JsonSerializable()
class CommentsModel {
  int postId;
  int id;
  String name;
  String email;
  String body;
  CommentsModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}

// @JsonSerializable()
// class albumsModel {
//   int userId;
//   int id;
//   String title;
//   albumsModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//   factory albumsModel.fromJson(Map<String, dynamic> json) =>
//       _$albumsModelFromJson(json);
//   Map<String, dynamic> toJson() => _$albumsModelToJson(this);
// }

// @JsonSerializable()
// class usersModel {
//   int id;
//   String name;
//   String username;
//   String email;
//   String address;
//   usersModel({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.address,
//   });

//   factory usersModel.fromJson(Map<String, dynamic> json) =>
//       _$usersModelFromJson(json);
//   Map<String, dynamic> toJson() => _$usersModelToJson(this);
// }
