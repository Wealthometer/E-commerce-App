import 'package:ecommerce_app_ui/controllers/theme_controller.dart';
import 'package:ecommerce_app_ui/models/allproduct.dart';
// import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/view/all_products_screen.dart';
import 'package:ecommerce_app_ui/view/cart_screen.dart';
// import 'package:ecommerce_app_ui/view/product_details_screen.dart';
import 'package:ecommerce_app_ui/view/widgets/category_chips.dart';
import 'package:ecommerce_app_ui/view/widgets/custom_search_bar.dart';
import 'package:ecommerce_app_ui/view/widgets/product_grid.dart';
import 'package:ecommerce_app_ui/view/widgets/sale_banner.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                16
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Wealth',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Good Day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.notifications_outlined
                      )
                  ),

                  IconButton(
                      onPressed: () => Get.to(() => CartScreen()),
                      icon: Icon(
                          Icons.shopping_bag_outlined
                      )
                  ),

                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode
                      ),
                    ),
                  )
                ],
              ),
            ),

            const CustomSearchBar(),

            const CategoryChips(),

            const SaleBanner(),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => AllProductsScreen),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
