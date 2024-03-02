import 'package:explore_ease/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=EEHelperFunctions.isDarkMode(context);
    return Positioned(
        right: EESizes.defaultSpace,
        bottom: EEDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: ()=> OnBoardingController.instance.nextpage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? EEColors.primary: Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}