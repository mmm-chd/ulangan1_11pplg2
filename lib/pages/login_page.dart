import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/background_component.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtextfield_component.dart';
import 'package:ulangan1_11pplg2/components/widget/socialbutton_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: CustomBackground(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Sign In",
                    size: 50,
                    color: MainColor.primaryColor,
                    weight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                  SpacingComponent(height: 2),
                  const CustomText(
                    text:
                        "One small task today, one big step toward your goal.",
                    size: 14,
                    color: TextColor.primaryTextColor,
                    weight: FontWeight.w500,
                    fontFamily: "Inter",
                  ),
                  SpacingComponent(height: 32),

                  // Username Field
                  CustomTextField(
                    controller: authController.usernameController,
                    hintText: "Username",
                    outlineColor: MainColor.primaryColor,
                    icon: Icons.person,
                  ),
                  SpacingComponent(height: 16),

                  // Password Field
                  Obx(
                    () => CustomTextField(
                      controller: authController.passwordController,
                      hintText: "Password",
                      outlineColor: MainColor.primaryColor,
                      icon: Icons.lock,
                      obsecureText: authController.showPassword(),
                      suffixIcon: IconButton(
                        onPressed: authController.togglePassword,
                        icon: Icon(authController.getPasswordIcon()),
                      ),
                    ),
                  ),

                  // Remember Me + Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: authController.checked(),
                              activeColor: MainColor.primaryColor,
                              splashRadius: 18,
                              onChanged: authController.toogleRememberMe,
                            ),
                          ),
                          const CustomText(
                            text: "Remember Me",
                            color: TextColor.primaryTextColor,
                            weight: FontWeight.w500,
                            size: 12,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "Forgot Password?",
                          color: TextColor.primaryTextColor,
                          weight: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                  SpacingComponent(height: 32),

                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    child: ButtonComponent(
                      height: 53,
                      width: 376,
                      backgroundColor: MainColor.primaryColor,
                      text: "Sign In",
                      size: 24,
                      weight: FontWeight.bold,
                      onPressed: () {
                        authController.login();
                      },
                    ),
                  ),

                  SpacingComponent(height: 32),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Don't Have an Account? ",
                        color: TextColor.primaryTextColor,
                        weight: FontWeight.w500,
                        size: 14,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CustomText(
                          text: " Sign Up",
                          color: MainColor.primaryColor,
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                      ),
                    ],
                  ),

                  SpacingComponent(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 1,
                        width: 110,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("OR"),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 1,
                        width: 110,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  SpacingComponent(height: 16),

                  const Text("Sign in with"),
                  SpacingComponent(height: 32),

                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/social_images/apple_icon.svg",
                      ),
                      const SpacingComponent(width: 16),
                      SvgPicture.asset(
                        "assets/images/social_images/facebook_icon.svg",
                      ),
                      const SpacingComponent(width: 16),
                      SvgPicture.asset(
                        "assets/images/social_images/google_icon.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
