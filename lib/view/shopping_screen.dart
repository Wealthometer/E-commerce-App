import 'package:ecommerce_app_ui/models/allproduct.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:ecommerce_app_ui/view/widgets/all_product_grid.dart';
import 'package:ecommerce_app_ui/view/widgets/category_chips.dart';
import 'package:ecommerce_app_ui/view/widgets/filter_bottom_sheet.dart';
// import 'package:ecommerce_app_ui/view/widgets/product_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import '../models/product.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final Product products;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
            'Shopping Screen'
        ),
      ),
    );
  }
}
