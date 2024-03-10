import 'package:explore_ease/features/authentication/screens/login/login.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: AssetImage(EEImage.verifyEmail),)
              ///Title & SubTitle
              ///Buttons
            ],

          ),
        ),
      ),
    );
  }
}
