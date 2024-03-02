import 'package:explore_ease/common/styles/spacing_styles.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title &Sub-Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 150,
                      image: AssetImage(
                          dark ? EEImage.lightAppLogo : EEImage.darkAppLogo)
                  ),
                  Text(EEText.LoginTitle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
