import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:ecommerce_app_ui/view/widgets/size_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //image
                AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.asset(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                ),
                )
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

    final String shopLink = 'https://example.com/products/' + productName;
    final String shareMessage = '$description\n\nShop now @ $shopLink';

    try {
      final ShareResult result = await Share.share(
          shareMessage,
          subject: productName,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
      );

      if (result.status == ShareResultStatus.success) {
        debugPrint(
            'Thank you for Sharing'
        );
      }
    }
    catch (e) {
      debugPrint(
          'Error Sharing: $e'
      );
    }
  }
}
