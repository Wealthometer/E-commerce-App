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

                //favorite button
                Positioned(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite
                              ? Theme.of(context).primaryColor
                              : (isDark ? Colors.white : Colors.black),
                        ),
                    ),
                )
              ],
            ),

            //product details
            Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                            product.name,
                            style: AppTextStyle.withColor(
                              AppTextStyle.h2,
                              Theme.of(context).textTheme.headlineMedium!.color!,
                            ),
                          )
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      )
                    ],
                  ),

                  Text(
                    product.category,
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!
                    ),
                  ),

                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  Text(
                    'Select Size',
                    style: AppTextStyle.withColor(
                      AppTextStyle.labelMedium,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.01,
                  ),

                  const SizeSelector(),

                  SizedBox(
                    height: screenWidth * 0.04,
                  ),

                  Text(
                    'Description',
                    style: AppTextStyle.withColor(
                      AppTextStyle.labelMedium,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),

                  SizedBox(
                    height: screenWidth * 0.01,
                  ),

                  Text(
                    product.description,
                    style: AppTextStyle.withColor(
                        AppTextStyle.bodySmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      //buttons
      bottomNavigationBar: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04,
              ),
            child: Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02
                          ),
                          side: BorderSide(
                            color: isDark ? Colors.white70 : Colors.black87
                          )
                        ),
                        child: Text(
                          "Add to cart",
                          style: AppTextStyle.withColor(
                              AppTextStyle.bodyMedium,
                              Theme.of(context).textTheme.bodyLarge!.color!
                          )
                        ),
                    )
                ),

                SizedBox(
                  width: screenWidth * 0.04,
                ),

                Expanded(
                    child: OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02
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
