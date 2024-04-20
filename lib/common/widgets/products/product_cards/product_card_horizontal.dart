import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/EE_circular_icon.dart';

class EEProductCardHorizontal extends StatelessWidget {
  const EEProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = EEHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(EESizes.landmarkImageRadius),
          color: dark ? EEColors.darkerGrey : EEColors.softGrey),
      child: Row(
        children: [
          ///Thumbnail
          EERoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(EESizes.sm),
            backgroundColor: dark ? EEColors.dark : EEColors.light,
            child: Stack(
              children: [
                ///thumbnail image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: EERoundedImage(
                        imageUrl: EEImage.landmark1, applyImageRadius: true)),

                /// discount tag
                Positioned(
                    top: 12,
                    child: EERoundedContainer(
                      radius: EESizes.sm,
                      backgroundColor: EEColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: EESizes.sm, vertical: EESizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: EEColors.black)),
                    )),

                /// favourite icon button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: EECircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: EESizes.sm, left: EESizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EEProductTitleText(
                        title: 'Taj Exotica Resort & Spa',
                        smallSize: true,
                      ),
                      SizedBox(height: EESizes.spaceBtwItems / 2),
                      EEBrandTitleVerifiedIcon(title: 'Goa'),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Price
                      const Flexible(child: EELandmarkPriceText(price: '5,000-10,000')),

                      ///Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: EEColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(EESizes.cardRadiusMd),
                            bottomRight:Radius.circular(EESizes.landmarkImageRadius),
                          ),

                        ),
                        child: const SizedBox(
                            width: EESizes.iconLg*1.2,
                            height: EESizes.iconLg*1.2,
                            child: Center(child: Icon(Iconsax.add, color: EEColors.white))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
