import 'package:explore_ease/features/authentication/screens/login/login.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.to(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60& of screen width
              Image(
                image: const AssetImage(EEImage.emailSent),
                width: EEHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              /// Title and Subtitle
              Text(
                EETexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                EETexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),
              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(EETexts.done))
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: (){},
                      child: const Text(EETexts.resendEmail))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
