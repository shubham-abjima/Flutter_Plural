import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';
@JsonSerializable()
class User{
  late  int id;
  late String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}