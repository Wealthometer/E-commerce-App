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
        IconButton(
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                            product.name,
                            style: AppTextStyle.withColor(
                              AppTextStyle.bodyLarge,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red[400],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              '1',
                              style: AppTextStyle.withColor(
                                AppTextStyle.h3,
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}