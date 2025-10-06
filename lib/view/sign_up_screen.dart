import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/app_textstyles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: isDark ? Colors.white :  Colors.black,
                    )
                ),
              const SizedBox(
                height: 24,
              ),

              Text(
                "Create Account",
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
