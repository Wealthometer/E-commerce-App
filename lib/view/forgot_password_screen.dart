import 'package:ecommerce_app_ui/view/widgets/custom_textfield.dart';
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
                "Enter Your Email To Rest Your Password",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),

              const SizedBox(height: 16),

              // const SizedBox(height: 40),

              CustomTextfield(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value){
                  if (value == null ||value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );


    void showSuccessDialog(BuildContext context) {
      Get.dialog(
          AlertDialog(
              title: Text(
                'Check Your Email',
                style: AppTextStyle.h3,
              ),
              content: Text(
                'We have sent password recovery instructions to your email.',
                style: AppTextStyle.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'OK',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
              ),
          );
    }

  }
}
