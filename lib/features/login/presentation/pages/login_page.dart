import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mate/config/themes/ap_colors.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/features/login/presentation/bloc/login_bloc.dart';
import 'package:move_mate/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "Welcome Again!",
              style: Appstyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  textColor: primaryColor),
            ),
             HightSpacer(size: 150),
             LoginForm(),
             HightSpacer(size: 200),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Appstyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      textColor: Colors.black),
                ),
                Text(
                  "\t Register",
                  style: Appstyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      textColor: primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
