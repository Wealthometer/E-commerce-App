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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom top bar
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Reset Password",
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const Spacer(flex: 2), // balances out spacing on the right
                ],
              ),

              const SizedBox(height: 12),

              Text(
                "Enter Your Email To Reset Your Password",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
                textAlign: TextAlign.end,
              ),

              const SizedBox(height: 32),

              CustomTextfield(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {


                  },
                  child: const Text('Send Reset Link'),
                ),
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
