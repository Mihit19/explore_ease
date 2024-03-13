import 'package:explore_ease/common/widgets/success_screen/success_screen.dart';
import 'package:explore_ease/features/authentication/screens/login/login.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/constants/text_strings.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(EEImage.verifyEmail),
                width: EEHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              ///Title & SubTitle
              Text(
                EETexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                'mrmihitkumar@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                EETexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                        image: EEImage.verificationSuccess,
                        title: EETexts.yourAccountCreatedTitle,
                        subTitle: EETexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                      child: const Text(EETexts.eContinue))),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(EETexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
