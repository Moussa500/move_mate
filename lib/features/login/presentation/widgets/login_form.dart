import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/core/common/widgets/my_text_field.dart';
import 'package:move_mate/core/common/widgets/outlinedButton.dart';
import 'package:move_mate/core/constants/app_constants.dart';
import 'package:move_mate/core/route/app_routes.dart';
import 'package:move_mate/features/login/presentation/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
listener: (context, state) {
      if (state.status.isSuccess) {
        context.goNamed(AppRoutes.home);
      }
      if (state.status.isFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const 
            SnackBar(content: Text("Error occured")));
      }
},
      child:BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
      return state.status.isInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        hintText: "Username",
                        errorText: state.username.displayError != null
                            ? "please enter a valid username"
                            : null,
                        obscureText: false,
                        enable: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(UserNameChange(username: value));
                        }),
                  ),
                  const HightSpacer(size: 80),
                  SizedBox(
                    width: width * 0.9,
                    child: CustomTextField(
                        errorText: state.password.displayError != null
                            ? "Please enter a valid password"
                            : null,
                        initialValue: state.password.value,
                        hintText: "password",
                        obscureText: true,
                        enable: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChange(password: value));
                        }),
                  ),
                  const HightSpacer(size: 100),
                  SizedBox(
                      width: 200,
                      child: CustomOutlinedbutton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginButtonPressed());
                        },
                        label: "Login",
                      )),
                ],
              ),
            );
    }
    )
    );
}
  }


