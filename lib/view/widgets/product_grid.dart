import 'package:ecommerce_app_ui/models/allproduct.dart';
// import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:ecommerce_app_ui/view/product_details_screen.dart';
import 'package:ecommerce_app_ui/view/widgets/all_product_card.dart';
// import 'package:ecommerce_app_ui/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductGrid extends StatelessWidget {
  final List<AllProduct> products;
  final int? limit;  // Add this
  
  const ProductGrid({super.key, required this.products, this.limit});

  @override
  Widget build(BuildContext context) {
    // Limit products if specified
    final displayProducts = limit != null ? products.take(limit!).toList() : products;
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16
      ),
      itemCount: displayProducts.length,
      itemBuilder: (context, index){
        final product = displayProducts[index];
        return GestureDetector(
          onTap: ()=> Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen(
              product: product,
            ))
          ),
          child: ProductCard(product: product),
        );
      }
    );
  }
}
