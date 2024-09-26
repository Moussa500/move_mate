import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String? token;
  const AuthUser({this.token});
  @override
  List<Object?> get props => [token];
}
