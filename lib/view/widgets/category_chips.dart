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
  final categories =  ['All', 'Men', 'Women', 'Girls'];

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
                    label: Text(""),
                    selected:
                ),
              ),
            )
        ),
      ),
    );
  }
}
