


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../main.dart';

class ControllerLocal extends GetxController {

  Locale intiallang = shared!.getString("lang") == null ? Get.deviceLocale! : Locale(shared!.getString("lang")!);

  void changeLang(String codelang) {
    Locale local = Locale(codelang);
    shared!.setString("lang", codelang);
    Get.updateLocale(local);
  } 
}