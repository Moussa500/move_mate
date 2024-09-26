class AuthReponseModel {
  final String? username;
  final bool? isActive;
  final String? email;
  final String? firstName;
  final String? lastName;
  AuthReponseModel(
      {this.username,
      this.isActive,
      this.email,
      this.firstName,
      this.lastName});
  factory AuthReponseModel.fromJson(Map<String, dynamic> json) {
    return AuthReponseModel(
      username: json["username"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      isActive: json["is_active"],
    );
  }
  AuthReponseModel fromJson(Map<String, dynamic> json) {
    return AuthReponseModel.fromJson(json);
  }

}
