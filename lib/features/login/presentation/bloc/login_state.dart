part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UserName username;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  const LoginState({
    this.username = const UserName.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  });
  LoginState copyWith({
    UserName? username,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid);
  }

  @override
  List<Object> get props => [username,password,isValid,status];
}

