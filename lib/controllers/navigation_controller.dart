// import 'package:ecommerce_app_ui/view/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController {

  final RxInt currentIndex = 0.obs;

  void changeIndex(int index){
    currentIndex.value = index;
  }

}