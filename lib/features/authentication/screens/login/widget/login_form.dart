import 'package:explore_ease/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';


class EELoginForm extends StatelessWidget {
  const EELoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: EESizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: EETexts.email),
            ),
            const SizedBox(height: EESizes.spaceBtwInputFields,),
            /// Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: EETexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: EESizes.spaceBtwInputFields/2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(EETexts.rememberMe),
                  ],
                ),
                /// Forget Password
                TextButton(onPressed: () => Get.off(() => const ForgetPassword()), child: const Text(EETexts.forgetPassword))
              ],
            ),
            const SizedBox(height: EESizes.spaceBtwSections),
            /// sign in button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(EETexts.signIn))),
            const SizedBox(height: EESizes.spaceBtwItems,),
            /// create account button
            SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(EETexts.createAccount))),
          ],
        ),
      ),
    );
  }
}

