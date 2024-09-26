import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:move_mate/core/common/helpers/form_helper.dart';
import 'package:move_mate/features/register/data/models/request/register_request.dart';
import 'package:move_mate/features/register/domain/usecases/register_use_case.dart';
import 'package:move_mate/service_locator.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailChange>(_onEmailChange);
    on<UserNameChange>(_onUserNameChange);
    on<FirstNameChange>(_onFirstNameChange);
    on<LastNameChange>(_onLastNameChange);
    on<PasswordChange>(_onPasswordChange);
    on<RegisterButttonPressed>(_onSubmitted);
  }
  //field value change
  void _onEmailChange(EmailChange event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
        isValid: Formz.validate([
      email,
      state.password,
      state.firstName,
      state.lastName,
      state.userName
    ])));
  }

  void _onPasswordChange(PasswordChange event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
        password,
        state.email,
        state.firstName,
        state.lastName,
        state.userName,
      ]),
    ));
  }

  void _onFirstNameChange(FirstNameChange event, Emitter<RegisterState> emit) {
    final firstName = Name.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
      isValid: Formz.validate([
        firstName,
        state.password,
        state.email,
        state.lastName,
        state.userName,
      ]),
    ));
  }

  void _onLastNameChange(LastNameChange event, Emitter<RegisterState> emit) {
    final lastName = Name.dirty(event.lastName);
    emit(state.copyWith(
      lastName: lastName,
      isValid: Formz.validate([
        lastName,
        state.password,
        state.email,
        state.lastName,
        state.userName,
      ]),
    ));
  }
  void _onUserNameChange(UserNameChange event, Emitter<RegisterState> emit) {
    final userName = UserName.dirty(event.userName);
    emit(state.copyWith(
      userName: userName,
      isValid: Formz.validate([
        userName,
        state.password,
        state.firstName,
        state.email,
        state.lastName,
      ]),
    ));
  }
//button pressed
  Future<void> _onSubmitted(
      RegisterButttonPressed event, Emitter<RegisterState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final firstName = Name.dirty(state.firstName.value);
    final lastName = Name.dirty(state.lastName.value);
    final userName = UserName.dirty(state.userName.value);
try {
      emit(state.copyWith(
        email: email,
        password: password,
        userName: userName,
        firstName: firstName,
        lastName: lastName));
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final response = await sl<RegisterUseCase>().call(RegisterRequest(
            username: state.userName.value,
            password: state.password.value,
            email: state.email.value,
            firstName: state.firstName.value,
            lastName: state.lastName.value));
        response.fold((l) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
          print(l);
        }, (r) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          print(r);
        });
        print(FormzSubmissionStatus);
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
        print(e);
      }
    }
} catch (e) {
  print("error : $e");
}
  }
}
