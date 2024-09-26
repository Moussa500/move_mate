import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mate/config/themes/app_theme.dart';
import 'package:move_mate/core/route/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(828,1792),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp.router(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          title: 'Move Mate',
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}