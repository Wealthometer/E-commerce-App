import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
                Icons.arrow_back,
                color: isDark ? Colors.white : Colors.black,
            )
        ),
        title: Text(
          "Details",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black
          ),
        ),
        actions: [
          // Share button
          IconButton(
              onPressed: () => _shareProduct (
                context,
                product.name,
                product.description
              ),
              icon: Icon(Icons.share)
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //image
              ],
            )
          ],
        ),
      ),
    );
  }

  //share product
  Future<void> _shareProduct(
      BuildContext context,
      String productName,
      String description
  )async {
    // get the render box for share position origin (required for ipad)
    final box = context.findRenderObject() as RenderBox?;

  }
}
