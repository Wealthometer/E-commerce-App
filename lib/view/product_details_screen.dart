import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            )
        title: Text(
          "Details"
        ),
      ),
    );
  }
}
