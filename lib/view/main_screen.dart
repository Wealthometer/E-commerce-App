import 'package:ecommerce_app_ui/controllers/navigation_controller.dart';
import 'package:ecommerce_app_ui/controllers/theme_controller.dart';
import 'package:ecommerce_app_ui/view/shopping_screen.dart';
import 'package:ecommerce_app_ui/view/widgets/custom_bottom_navbar.dart';
import 'package:ecommerce_app_ui/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app_ui/view/account_screen.dart';
import 'package:ecommerce_app_ui/view/home_screen.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';


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
                      HomeScreen(),
                      ShoppingScreen(),
                      WishlistScreen(),
                      AccountScreen(),
                    ],
                  )
              ),
          ),
          bottomNavigationBar: const CustomBottomNavbar(),
        )
    );
  }
}
