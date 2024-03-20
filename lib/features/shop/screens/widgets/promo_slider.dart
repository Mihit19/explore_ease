import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_ease/features/shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shape/container/circular_container.dart';
import '../../../../common/widgets/images/EE_rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class EEPromoSlider extends StatelessWidget {
  const EEPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
            items: banners.map((url) => EERoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(
          height: EESizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  EECircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i? EEColors.primary : EEColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
