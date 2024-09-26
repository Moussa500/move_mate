import 'package:move_mate/core/base/base_model.dart';

class LoginRequest extends BaseModel<LoginRequest> {
  final String? username;
  final String? password;
  LoginRequest({this.username, this.password});

  @override
  LoginRequest fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      username: json["username"],
      password: json["password"],
    );
  }

  @override
  List<Object?> get props => [username, password];

  @override
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
