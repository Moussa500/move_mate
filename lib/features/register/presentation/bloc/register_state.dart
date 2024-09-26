part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final Email email;
  final Password password;
  final UserName userName;
  final Name firstName;
  final Name lastName;
  final bool isValid;
  final FormzSubmissionStatus status;
  const RegisterState(
      {this.isValid = false,
      this.status = FormzSubmissionStatus.initial,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.userName = const UserName.pure(),
      this.firstName = const Name.pure(),
      this.lastName = const Name.pure()});
  RegisterState copyWith({
    Email? email,
    Password? password,
    UserName? userName,
    Name? firstName,
    Name? lastName,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return RegisterState(
      userName: userName??this.userName,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        status: status??this.status,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  @override
  List<Object> get props => [email, password, userName, firstName, lastName];
}
