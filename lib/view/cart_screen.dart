import 'package:ecommerce_app_ui/models/allproduct.dart';
import 'package:ecommerce_app_ui/models/product.dart';
import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading:
        xIconButton(
            onPressed: () => Get.back(),
            icon: Icon(
                Icons.arrow_back_ios
            )
        ),
        title: Text(
          "Cart",
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white :Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(
                    16
                ),
                itemCount: allProduct.length,
                itemBuilder: (context, index) =>  _buildCartItem(
                    context,
                    allProduct[index]
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, AllProduct product){
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(
          bottom: 16
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(
              16
          ),
          boxShadow: [
            BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2)
            )
          ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                  16
              ),
            ),
            child: Image.asset(
              product.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}