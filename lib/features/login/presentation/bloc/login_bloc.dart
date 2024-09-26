import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:move_mate/core/common/helpers/form_helper.dart';
import 'package:move_mate/features/login/data/models/request/login_request.dart';
import 'package:move_mate/features/login/domain/usecases/login_use_case.dart';
import 'package:move_mate/service_locator.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
    on<UserNameChange>(_onUserNameChange);
    on<PasswordChange>(_onPasswordChange);
    on<LoginButtonPressed>(_onSubmitted);
  }
  //field value change
  void _onUserNameChange(UserNameChange event, Emitter<LoginState> emit) {
    final userName = UserName.dirty(event.username);
    emit(state.copyWith(
        username: userName,
        isValid: Formz.validate([
          userName,
          state.password,
        ])));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.username,
          password,
        ])));
  }

  //login Buttton pressed
  void _onSubmitted(LoginButtonPressed event, Emitter<LoginState> emit) async {
    final userName = UserName.dirty(state.username.value);
    final password = Password.dirty(state.password.value);
    try {
      emit(state.copyWith(
        username: userName,
        password: password,
      ));
      if (state.isValid) {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        try {
          final response = await sl<LoginUseCase>().call(LoginRequest(
            username: state.username.value,
            password: state.password.value,
          ));
          response.fold((l) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
            print("response:$l");
          }, (r) {
            emit(state.copyWith(status: FormzSubmissionStatus.success));
            print("response:$r");
          });
          print(FormzSubmissionStatus);
        } catch (e) {
          print("Error:$e");
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
          emit(state.copyWith(status: FormzSubmissionStatus.initial));
        }
      }
    } catch (e) {
      print("Error:$e");
    }
  }
}
