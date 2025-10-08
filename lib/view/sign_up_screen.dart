import 'package:ecommerce_app_ui/view/main_screen.dart';
import 'package:ecommerce_app_ui/view/signin_screen.dart';
import 'package:ecommerce_app_ui/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../utils/app_textstyles.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                height: 20,
              ),

              Text(
                "Create Account",
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                "Sign-Up to get started¡",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              CustomTextfield(
                label: "Full Name",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.name,
                // isPassword: true,
                // controller: _passwordController,
                validator: (value){
                  if (value == null ||value.isEmpty) {
                    return "Please enter your Full Name";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16,
              ),

              CustomTextfield(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                // isPassword: true,
                controller: _emailController,
                validator: (value){
                  if (value == null ||value.isEmpty) {
                    return "Please enter your Email";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please Enter A valid Email";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16,
              ),

              CustomTextfield(
                label: "Password",
                prefixIcon: Icons.lock_outline_sharp,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value){
                  if (value == null ||value.isEmpty) {
                    return "Please enter your Password";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16,
              ),

              CustomTextfield(
                label: "Confirm Password",
                prefixIcon: Icons.lock_open_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value){
                  if (value == null ||value.isEmpty) {
                    return "Please enter your Password";
                  }
                  if (value != _passwordController.text) {
                    return "Password doesn't match";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 24,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const MainScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text(
                      "Sign Up",
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium, 
                        Colors.white
                      ),
                    ),
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => SigninScreen()),
                    child: Text(
                      'Sign In',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
