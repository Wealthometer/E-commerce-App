import 'package:ecommerce_app_ui/models/allproduct.dart';
// import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:ecommerce_app_ui/view/product_details_screen.dart';
import 'package:ecommerce_app_ui/view/widgets/all_product_card.dart';
import 'package:ecommerce_app_ui/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllProductGrid extends StatelessWidget {
  const AllProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16
      ),
      itemCount: allProduct.length,
      itemBuilder: (context, index){
        final products = allProduct[index];
        return GestureDetector(
          onTap: ()=> Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => AllProductsScreen(
              products: products,
            ))
          ),
          child: AllProductCard(products: products),
        );
      }
    );
  }
}
