import 'package:ecommerce_app_ui/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 41,
                ),
                Text(
                  "Welcome Back!¡",
                  style: AppTextStyle.withColor(
                    AppTextStyle.h1,
                    Theme.of(context).textTheme.bodyLarge!.color!
                  ),
                ),
                Text(
                  "Sign In To Continue Shopping",
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
