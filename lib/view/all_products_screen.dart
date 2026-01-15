import 'package:ecommerce_app_ui/models/allproduct.dart';
// import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:ecommerce_app_ui/view/widgets/all_product_grid.dart';
import 'package:ecommerce_app_ui/view/widgets/filter_bottom_sheet.dart';
// import 'package:ecommerce_app_ui/view/widgets/size_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required AllProduct products});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
                Icons.arrow_back_ios_new,
              color: isDark ? Colors.white : Colors.black,
            )
        ),
        title: Text(
          'All Products',
          style: AppTextStyle.withColor(
            AppTextStyle.h2,
            isDark ? Colors.white : Colors.black
          ),
        ),
        actions: [
          //search icon
          IconButton(
              onPressed: (){},
              icon: Icon(
                  Icons.search_outlined,
                color: isDark ? Colors.white : Colors.black,
                weight: 300,
                size: 28,
              )
          ),

          //filter button
          IconButton(
              onPressed: () => FilterBottomSheet.show(context),
              icon: Icon(
                Icons.filter_list,
                color: isDark ? Colors.white : Colors.black,
                weight: 300,
                size: 28,
              )
          ),
        ],
      ),
      body: AllProductGrid(),
    );
  }
}
