import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/component/background_component.dart';
import 'package:ulangan1_11pplg2/components/color/component/button_component.dart';
import 'package:ulangan1_11pplg2/components/color/component/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/color/component/customtextfield_component.dart';
import 'package:ulangan1_11pplg2/components/color/component/space_component.dart';
import 'package:ulangan1_11pplg2/controller/login_controller.dart';

class LoginController extends GetxController {
  var rememberMe = false.obs;
  var obscurePassword = true.obs;
}

class LoginPage extends StatelessWidget {
  final LoginController c = Get.put(LoginController());

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpacingComponent(height: 80,),
              const CustomText(
                text: "Sign In",
                size: 60,
                color: Colors.purple,
                weight: FontWeight.bold,
                fontFamily: "Inter",
              ),
              SpacingComponent(height: 8),
              const CustomText(
                text: "One small task today, one big step toward your goal.",
                size: 18,
                color: Colors.purple,
                weight: FontWeight.bold,
                fontFamily: "Inter",
              ),
              SpacingComponent(height: 44),

              // Username Field
              CustomTextField(
                hint: "Username", 
                color: Colors.purple, 
                icon: Icons.person,
              ),
              SpacingComponent(height: 16),

              // Password Field
              Obx(() => CustomTextField(
                hint: "Password", 
                color: Colors.purple, 
                icon: Icons.lock,
                obsecureText: c.obscurePassword.value, ),
                ),
              SpacingComponent(height: 40),

              // Remember Me + Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: [
                          Checkbox(
                            value: c.rememberMe.value,
                            onChanged: (val) {
                              c.rememberMe.value = val!;
                            },
                          ),
                          const Text("Remember Me"),
                        ],
                      )),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  )
                ],
              ),
              SpacingComponent(height: 40),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ButtonComponent(
                  height: 65, 
                  width: 376, 
                  color: Colors.white, 
                  text: "Sign In", 
                  size: 28, 
                  weight: FontWeight.bold, 
                  onPressed: (){},)
              ),

              SpacingComponent(height: 32),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t Have an Account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFA62671),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SpacingComponent(height: 37),

              const Text("Sign in with"),
              SpacingComponent(height: 20),

              // Social Buttons
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     _socialButton("assets/google.png"),
              //     const SizedBox(width: 16),
              //     _socialButton("assets/apple.png"),
              //     const SizedBox(width: 16),
              //     _socialButton("assets/facebook.png"),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _socialButton(String asset) {
  //   return InkWell(
  //     onTap: () {},
  //     child: CircleAvatar(
  //       radius: 20,
  //       backgroundColor: Colors.white,
  //       backgroundImage: AssetImage(asset),
  //     ),
  //   );
  // }
}