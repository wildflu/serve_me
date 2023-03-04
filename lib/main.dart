import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:serveme/point_access.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/local/controller_local.dart';
import 'controller/local/local.dart';
import 'controller/theme/theme.dart';
import 'pages/home_screen.dart';

SharedPreferences? shared;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  shared = await SharedPreferences.getInstance();
  ControllerLocal localcontroler = Get.put(ControllerLocal());

  runApp(
    GetMaterialApp(
      home: const MyApp(),
      title: "X",
      locale: localcontroler.intiallang,
      translations:  Mylocal(),
      theme: Themes.thetheme,
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenHome();
  }
}