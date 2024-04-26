import 'package:explore_ease/common/styles/shadows.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/features/shop/controllers/landmark_controller.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/landmark_detail.dart';
import 'package:explore_ease/main.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/EE_circular_icon.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/landmark_price_text.dart';
import '../../texts/product_title_text.dart';

class EEProductCardVertical extends StatelessWidget {
  const EEProductCardVertical({super.key, required this.landmark});

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {
    final controller = LandmarkController.instance;
    final salePercentage = controller.calculateSalePercentage(landmark.price, landmark.salePrice);
    final bool dark = EEHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => LandmarkDetailScreen(landmark: landmark,)),
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
              width: 180,
              padding: const EdgeInsets.all(EESizes.sm),
              backgroundColor: dark ? EEColors.dark : EEColors.light,
              child: Stack(
                children: [
                  ///thumbnail image
                   Center(
                     child: EERoundedImage(
                        imageUrl: landmark.thumbnail, applyImageRadius: true, isNetworkImage: true,),
                   ),

                  /// discount tag
                  Positioned(
                      top: 12,
                      child: EERoundedContainer(
                        radius: EESizes.sm,
                        backgroundColor: EEColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: EESizes.sm, vertical: EESizes.xs),
                        child: Text('$salePercentage%',
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
            const SizedBox(height: EESizes.spaceBtwItems / 2),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: EESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EEProductTitleText(
                    title: landmark.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: EESizes.spaceBtwItems / 2),
                  EEBrandTitleVerifiedIcon(
                    title: landmark.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                

                Flexible(
                  child: Column(
                    children: [
                      if(landmark.productType == ProductType.single.toString() && landmark.salePrice>0)
                        Padding(
                          padding: const EdgeInsets.only(left: EESizes.sm),
                          child: Flexible(
                              child: Text(landmark.price.toString(),
                              style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                              )),
                        ),
                      ///price
                      Padding(
                        padding: const EdgeInsets.only(left: EESizes.sm),
                        child: Flexible(
                            child: EELandmarkPriceText(
                          price: controller.getLandmarkPrice(landmark),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: EEColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(EESizes.cardRadiusMd),
                      bottomRight: Radius.circular(EESizes.landmarkImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: EESizes.iconLg * 1.2,
                      height: EESizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: EEColors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
