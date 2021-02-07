import 'package:test_app/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String name,
    String username,
    String password,
  }) : super(
          name: name,
          password: password,
          username: username,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        password: json["password"],
        username: json["username"]);
  }
}
