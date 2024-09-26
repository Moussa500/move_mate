import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/config/themes/ap_colors.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/core/route/app_routes.dart';
import 'package:move_mate/features/register/presentation/bloc/register_bloc.dart';
import 'package:move_mate/features/register/presentation/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child:  SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HightSpacer(size: 200),
                const  Text(
                  "Welcome!",
                  style: Appstyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      textColor: primaryColor),
                ),
                 const HightSpacer(size: 150),
                 const RegisterForm(),
                 const HightSpacer(size: 200),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an accountt?",
                      style: Appstyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textColor: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => context.pushNamed(AppRoutes.loginPage),
                      child: const Text(
                        "\t login",
                        style: Appstyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            textColor: primaryColor),
                      ),
                    ),
                  ],
                ),
                const HightSpacer(size: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
