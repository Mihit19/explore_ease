import 'package:explore_ease/common/widgets/login_signup/form_divider.dart';
import 'package:explore_ease/common/widgets/login_signup/social_button.dart';
import 'package:explore_ease/features/authentication/screens/login/login.dart';
import 'package:explore_ease/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/constants/text_strings.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                EETexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              ///Form
              const EESignupForm(),
              const SizedBox(height: EESizes.spaceBtwSections,),
              /// Divider
              EEFormDivider(dividerText: EETexts.orSignUpWith.capitalize!),
              const SizedBox(height: EESizes.spaceBtwSections,),

              ///Social Buttons
              const EESocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}


