import 'package:flutter/material.dart';
import 'package:move_mate/app.dart';
import 'package:move_mate/service_locator.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies().initialize();
  runApp(const App());
}
 