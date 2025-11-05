import 'package:ecommerce_app_ui/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController()
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Main Screen"
        ),
      ),
    );
  }
}
