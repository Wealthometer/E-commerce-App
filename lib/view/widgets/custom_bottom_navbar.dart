import 'package:ecommerce_app_ui/controllers/navigation_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();
    return Obx(
        () => BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) => navigationController.changeIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Shopping'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Account'
            ),
          ],
        )
    );
  }
}
