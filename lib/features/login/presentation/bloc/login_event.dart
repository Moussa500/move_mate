part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}
class UserNameChange extends LoginEvent {
  final String username;
  const UserNameChange({required this.username});
}
class PasswordChange extends LoginEvent {
  final String password;
  const PasswordChange({required this.password});
}
class LoginButtonPressed extends LoginEvent{
}