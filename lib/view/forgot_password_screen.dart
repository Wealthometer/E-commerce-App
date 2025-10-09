import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_textstyles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: isDark ? Colors.white :  Colors.black,
                  )
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                "Reset Password",
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),

              const SizedBox(
                  height: 8
              ),

              Text(
                "Sign In To Continue Shopping",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!, 
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
