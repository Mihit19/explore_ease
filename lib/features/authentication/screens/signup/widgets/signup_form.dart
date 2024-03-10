import 'package:explore_ease/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../login/login.dart';

class EESignupForm extends StatelessWidget {
  const EESignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EETexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: EESizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EETexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),
          ///Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: EETexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),
          ///Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: EETexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),
          ///Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: EETexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),
          ///Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: EETexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),
          ///Terms and conditions checkbox
          const EETermsAndConditionCheckBox(),
          const SizedBox(height: EESizes.spaceBtwSections,),
          ///create account Button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(EETexts.createAccount)),)
        ],
      ),
    );
  }
}

