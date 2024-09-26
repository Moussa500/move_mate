part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

//email change
class EmailChange extends RegisterEvent {
  final String email;

  const EmailChange({required this.email});
}



//first name change
class FirstNameChange extends RegisterEvent {
  final String firstName;

  const FirstNameChange({required this.firstName});
}
class FirstNameChangeUnfocus extends RegisterEvent {}
//last name change
class LastNameChange extends RegisterEvent {
  final String lastName;

  const LastNameChange({required this.lastName});
}

//Password change
class PasswordChange extends RegisterEvent {
  final String password;
  const PasswordChange({required this.password});
}
//userName
class UserNameChange extends RegisterEvent {
  final String userName;
  const UserNameChange({required this.userName});
}
//button pressed
class RegisterButttonPressed extends RegisterEvent {}
