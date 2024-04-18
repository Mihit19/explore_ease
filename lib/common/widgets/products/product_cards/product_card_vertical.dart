import 'package:explore_ease/common/styles/shadows.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/EE_circular_icon.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/landmark_price_text.dart';
import '../../texts/product_title_text.dart';

class EEProductCardVertical extends StatelessWidget {
  const EEProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = EEHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [EEShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(EESizes.landmarkImageRadius),
            color: dark ? EEColors.darkerGrey : EEColors.white),
        child: Column(
          children: [

            ///Thumbnail, wishlist button
            EERoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(EESizes.sm),
              backgroundColor: dark ? EEColors.dark : EEColors.light,
              child: const Stack(
                children: [

                  ///thumbnail image
                  EERoundedImage(
                      imageUrl: EEImage.landmark1, applyImageRadius: true),

                  /// favourite icon button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: EECircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(height: EESizes.spaceBtwItems / 2),

            ///Details
            const Padding(
                padding: EdgeInsets.only(left: EESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EEProductTitleText(
                      title: 'Hotel in Goa', smallSize: true,),
                    SizedBox(height: EESizes.spaceBtwItems / 2),
                    EEBrandTitleVerifiedIcon(title: 'hotel',),
                  ],
                ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ///price
                const Padding(
                  padding: EdgeInsets.only(left: EESizes.sm),
                  child: EELandmarkPriceText(price: '5k-10k',),
                ),
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
    );
  }
}



