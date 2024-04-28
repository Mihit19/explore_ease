import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:explore_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/landmark_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/EE_circular_icon.dart';

class EEProductCardHorizontal extends StatelessWidget {
  const EEProductCardHorizontal({super.key, required this.landmark});


  final LandmarkModel landmark;
  @override
  Widget build(BuildContext context) {
    final controller = LandmarkController.instance;
    final salePercentage = controller.calculateSalePercentage(landmark.price, landmark.salePrice);
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
                SizedBox(
                    height: 120,
                    width: 120,
                    child: EERoundedImage(
                        imageUrl: landmark.thumbnail, applyImageRadius: true, isNetworkImage: true,)),

                /// discount tag
                 if(salePercentage != null)
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
                Positioned(
                    top: 0,
                    right: 0,
                    child: EEFavouriteIcon(landmarkId: landmark.id)),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: EESizes.sm, left: EESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EEProductTitleText(
                        title: landmark.title,
                        smallSize: true,
                      ),
                      const SizedBox(height: EESizes.spaceBtwItems / 2),
                      EEBrandTitleVerifiedIcon(title: landmark.brand!.name),
                    ],
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

                      ///Add to cart
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
          )
        ],
      ),
    );
  }
}
