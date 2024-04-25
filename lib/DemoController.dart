import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DemoController extends GetxController {
  RxInt number = 0.obs;
  TextEditingController nameController = TextEditingController();
  RxString name = "".obs;

  void setName() {
    name.value = nameController.text;
    nameController.clear();
  }

  RxDouble sliderValue = 0.0.obs;
  RxString downValue = "pokhara".obs;

  RxBool isDarkMode = false.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}
