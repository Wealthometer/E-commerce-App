import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20)
          )
        ),
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter Products',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.close,
                          color: isDark ? Colors.white : Colors.black,
                          size: 28,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  Text(
                    'Price Range',
                    style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        Theme.of(context).textTheme.bodyLarge!.color!
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Min',
                            prefixText: '\$',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                              )
                            )
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 16,
                      ),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Max',
                              prefixText: '\$',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  Text(
                    'Categories',
                    style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        Theme.of(context).textTheme.bodyLarge!.color!
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'All',
                      'Shoes',
                      'Clothing',
                      'Accessories',
                      'Bags',
                      'Electronics'
                    ].map((category) => FilterChip(
                      label: Text(
                                category
                              ),
                      selected: category == 'All',
                      onSelected: (selected) {},
                      backgroundColor: Theme.of(context).cardColor,
                      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                      labelStyle: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        category == 'All'
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyLarge!.color!
                      ),
                    )).toList(),
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),

                          )
                        ),
                        child: Text(
                          'Apply Filters',
                          style: AppTextStyle.withColor(
                              AppTextStyle.buttonMedium,
                              Colors.white
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}