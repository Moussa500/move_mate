import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/core/constants/api_constants.dart';
import 'package:move_mate/features/houses_list/presentation/pages/houses_list_page.dart';
import 'package:move_mate/features/login/presentation/pages/login_page.dart';
import 'package:move_mate/features/register/presentation/pages/register_page.dart';
import 'package:move_mate/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoutes {
  static const home = '/';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static animatedPage(
      BuildContext context, GoRouterState state, Widget widget) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        });
  }
  static final GoRouter router = GoRouter(
      initialLocation: signUpPage,
      navigatorKey: GlobalKey<NavigatorState>(),
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
      routes: [
        GoRoute(
          name: home,
            path: home,
            builder: (context, state) => const HousesListPage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state, const HousesListPage())),
        GoRoute(
          name: loginPage,
            path: loginPage,
            builder: (context, state) => const LoginPage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state, const LoginPage())),
        GoRoute(
          name: signUpPage,
            path: signUpPage,
            builder: (context, state) => const RegisterPage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state, const RegisterPage())),
      ],
      redirect: (BuildContext context,GoRouterState state){
        final isAuthenticated=sl<SharedPreferences>().containsKey(ApiConstants.accessToken);
        if (!isAuthenticated) {
          return loginPage;
        }else{
          return home;
        }
      }
);
}
