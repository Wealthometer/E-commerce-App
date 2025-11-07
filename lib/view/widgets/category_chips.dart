import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int selectedIndex = 0;
  final categories =  ['All', 'Men', 'Women', 'Girls', 'Boys'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Row(
        children: List.generate(
          categories.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: 12
              ),
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 300
                ),
                curve: Curves.easeInOut,
                child: ChoiceChip(
                    label: Text(
                      categories[index],
                      style: AppTextStyle.withColor(
                        selectedIndex == index
                            ? AppTextStyle.withWeight(
                          AppTextStyle.bodySmall,
                          FontWeight.w600,
                        ) : AppTextStyle.bodySmall,
                        selectedIndex == index ?
                            Colors.white :
                            isDark ? Colors.grey[100]! : Colors.grey[600]!,
                      ),
                    ),
                    selected: selectedIndex == index,
                  onSelected: (bool selected){
                      setState(() {
                        selectedIndex = selected ? index : selectedIndex;
                      });
                  },
                ),
              ),
            )
        ),
      ),
    );
  }
}
