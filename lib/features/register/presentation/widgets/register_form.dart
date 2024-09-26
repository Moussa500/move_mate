import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/core/common/widgets/my_text_field.dart';
import 'package:move_mate/core/common/widgets/outlinedButton.dart';
import 'package:move_mate/core/constants/app_constants.dart';
import 'package:move_mate/core/route/app_routes.dart';
import 'package:move_mate/features/register/presentation/bloc/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.goNamed(AppRoutes.home);
        }
      },
      child:
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
        final isValid =
            context.select((RegisterBloc bloc) => bloc.state.isValid);
        return state.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.userName.displayError != null
                            ? "Username can only contain letters, numbers"
                            : null,
                        initialValue: state.userName.value,
                        helperText: "Choose a unique username",
                        hintText: "Username",
                        obscureText: false,
                        enable: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameChange(userName:value));
                        }),
                  ),
                  const HightSpacer(size: 80),
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.firstName.displayError != null
                            ? "Please enter a valid last name"
                            : null,
                        initialValue: state.firstName.value,
                        helperText: 'Enter your first name using letters only',
                        hintText: "first name",
                        obscureText: false,
                        enable: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(FirstNameChange(firstName:value));
                        }),
                  ),
                  const HightSpacer(size: 80),
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.lastName.displayError != null
                            ? "Please enter a valid last name"
                            : null,
                        initialValue: state.lastName.value,
                        helperText: 'Enter your first name using letters only',
                        hintText: "last name",
                        obscureText: false,
                        enable: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(LastNameChange(lastName:value));
                        }),
                  ),
                  const HightSpacer(size: 80),
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.email.displayError != null
                            ? "Please enter a valid email address"
                            : null,
                        initialValue: state.email.value,
                        helperText:
                            'A complete, valid email e.g. joe@gmail.com',
                        hintText: "email",
                        obscureText: false,
                        enable: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(EmailChange(email: value));
                        }),
                  ),
                  const HightSpacer(size: 80),
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.password.displayError != null
                            ? "Please enter a valid password"
                            : null,
                        initialValue: state.firstName.value,
                        helperText:
                            "Password must include at least one uppercase letter, one lowercase letter, one number, and one special character",
                        hintText: "password",
                        obscureText: true,
                        enable: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordChange(password: value));
                        }),
                  ),
                  const HightSpacer(size: 100),
                  SizedBox(
                      width: 200,
                      child: CustomOutlinedbutton(
                        onPressed: () {
                          try {
                            isValid
                                ? context
                                    .read<RegisterBloc>()
                                    .add(RegisterButttonPressed())
                                : print("${state.userName.value}");
                          } catch (e) {
                            print(e);
                          }
                        },
                        label: "Register",
                      )),
                ],
              );
      }),
    );
  }
}
