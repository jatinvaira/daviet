import 'package:buxx/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:buxx/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:buxx/utils/constants/image_strings.dart';
import 'package:buxx/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:buxx/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:buxx/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:buxx/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black: TColors.white,
        body: Stack(
      children: [
        // Horizontal scrollable pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
                image: DImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1),
            OnBoardingPage(
                image: DImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2),
            OnBoardingPage(
                image: DImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3),
          ],
        ),

        // skip button

        const OnBoardingSkip(),

        // Smooth page indicator
        const OnBoardingDotNavigation(),

        // circular button
        const OnBoardingNextButton()

      ],

    ));
  }
}




