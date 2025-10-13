import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/background_component.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtextfield_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/auth_controller.dart';

class LoginPageWide extends StatelessWidget {
  LoginPageWide({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Row(
          children: [
            //illus
            Expanded(
              flex: 3,
              child: Container(
                color: MainColor.primaryColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(48),
                    child: Image.asset(
                      "assets/images/login.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            //login form
            Expanded(
              flex: 3,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 48,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: "Sign In",
                          size: 30,
                          color: MainColor.primaryColor,
                          weight: FontWeight.bold,
                          fontFamily: "Inter",
                        ),
                        SpacingComponent(height: 2),
                        const CustomText(
                          text:
                              "One small task today, one big step toward your goal.",
                          size: 16,
                          color: TextColor.primaryTextColor,
                          weight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                        SpacingComponent(height: 40),

                        // Username Field
                        CustomTextField(
                          controller: authController.usernameController,
                          hintText: "Username",
                          outlineColor: MainColor.primaryColor,
                          icon: Icons.person,
                        ),
                        SpacingComponent(height: 20),

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

                        // Remember Me & Forgot Password
                        SpacingComponent(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: authController.checked(),
                                    activeColor: MainColor.primaryColor,
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

                        // Sign In Button
                        SpacingComponent(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonComponent(
                            height: 53,
                            width: 376,
                            backgroundColor: MainColor.primaryColor,
                            text: "Sign In",
                            size: 20,
                            weight: FontWeight.bold,
                            onPressed: authController.login,
                          ),
                        ),

                        // Sign Up Text
                        SpacingComponent(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: "Don't Have an Account?",
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

                        // Divider with OR
                        SpacingComponent(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.black),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("OR"),
                            ),
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.black),
                            ),
                          ],
                        ),

                        // Social Sign-In
                        SpacingComponent(height: 24),
                        const Text("Sign in with"),
                        SpacingComponent(height: 16),
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
          ],
        ),
      ),
    );
  }
}
