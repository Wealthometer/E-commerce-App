import 'package:ecommerce_app_ui/models/allproduct.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/app_textstyles.dart';

class AllProductCard extends StatelessWidget {
  final AllProduct products;
  const AllProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    products.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    products.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: products.isFavorite
                        ? Theme.of(context).primaryColor
                        : isDark
                        ? Colors.grey[400]
                        : Colors.grey,
                  ),
                ),
              ),

              if (products.oldPrice != null)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${calculateDiscount(products.price, products.oldPrice!)}% OFF',
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                          AppTextStyle.buttonSmall,
                          FontWeight.bold,
                        ),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(
                screenWidth * 0.02
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.name,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.h3, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: screenWidth * 0.01)
                ,
                Text(
                  products.category,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.01,
                ),
                
                Row(
                  children: [
                    Text(
                      '\$${products.price.toStringAsFixed(2)}  ',
                      style: AppTextStyle.withColor(
                          AppTextStyle.withWeight(AppTextStyle.bodyLarge, FontWeight.bold),
                          Theme.of(context).textTheme.bodyLarge!.color!,
                      )
                    ),
                    if( products.oldPrice != null ) ...[
                      Text(
                          '\$${products.oldPrice!.toStringAsFixed(2)}',
                          style: AppTextStyle.withColor(
                            AppTextStyle.bodySmall,
                            isDark ? Colors.grey[400]! : Colors.grey[600]!,
                          ).copyWith(
                            decoration: TextDecoration.lineThrough,
                          )
                      ),
                    ]
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // calculate discount
  int calculateDiscount( double currentPrice, double oldPrice) {
    return (((oldPrice - currentPrice) / oldPrice) *100).round();
  }
}
