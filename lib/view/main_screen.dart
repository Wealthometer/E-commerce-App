import 'package:ecommerce_app_ui/controllers/navigation_controller.dart';
import 'package:ecommerce_app_ui/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController()
    );

    return GetBuilder<ThemeController>(
        builder: (themeController) => Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 200
              ),
              child: Obx(
                  () => IndexedStack(
                    key: ValueKey(navigationController.currentIndex.value),
                    index: navigationController.currentIndex.value,
                    children: [
                      // HomeScreen(),
                      // ShoppingScreen(),
                      // WishlistScreen(),
                      // AccountScreen(),
                    ],
                  )
              ),
          ),
        )
    );
  }
}
