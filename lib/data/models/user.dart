import 'package:auth_app/domain/entities/user.dart';

class UserModel {
  final String email;
  final String username;

  UserModel({
    required this.email,
    required this.username,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
    };
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      username: username,
    );
  }
}
