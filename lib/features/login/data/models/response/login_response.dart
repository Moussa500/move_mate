class AuthReponseModel {
  String? refreshToken;
  String? accessToken;

  AuthReponseModel({this.refreshToken, this.accessToken});
  factory AuthReponseModel.fromJson(Map<String, dynamic> json) {
    return AuthReponseModel(
        refreshToken: json["refresh"], accessToken: json["access"]);
  }
  AuthReponseModel fromJson(Map<String, dynamic> json) {
    return AuthReponseModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      "refresh": refreshToken,
      "access":accessToken,
    };
  }
}
