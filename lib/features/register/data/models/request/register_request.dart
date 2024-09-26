import 'package:move_mate/core/base/base_model.dart';

class RegisterRequest extends BaseModel<RegisterRequest> {
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;

  RegisterRequest(
      {required this.username,
      required this.password,
      required this.email,
      required this.firstName,
      required this.lastName});

  @override
  RegisterRequest fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"]);
  }

  @override
  List<Object?> get props => [username,password,email,firstName,lastName];

  @override
  Map<String, dynamic> toJson() {
    return {
      "username":username,
      "email":email,
      "password":password,
      "first_name":firstName,
      "last_name":lastName,
    };
  }
}
