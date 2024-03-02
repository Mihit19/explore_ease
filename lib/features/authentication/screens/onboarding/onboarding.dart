import 'package:explore_ease/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:explore_ease/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:explore_ease/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:explore_ease/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:explore_ease/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:get/get.dart';


import 'widgets/onboarding_dot_navigation.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: EEImage.onBoardingImage1,
                title: EETexts.onBoardingTitle1,
                subTitle: EETexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EEImage.onBoardingImage2,
                title: EETexts.onBoardingTitle2,
                subTitle: EETexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EEImage.onBoardingImage3,
                title: EETexts.onBoardingTitle3,
                subTitle: EETexts.onBoardingSubTitle3,
              )
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          const OnBoardingNextButton()
        ],
      ),
    );
  }
}


