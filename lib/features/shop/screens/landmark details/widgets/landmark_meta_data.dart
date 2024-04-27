import 'package:explore_ease/common/widgets/images/EE_circular_image.dart';
import 'package:explore_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/features/shop/controllers/landmark_controller.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/constants/enums.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EELandmarkMetaData extends StatelessWidget {
  const EELandmarkMetaData({super.key, required this.landmark});

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {
    final controller = LandmarkController.instance;
    final salePercentage = controller.calculateSalePercentage(landmark.price, landmark.salePrice);
    final dark = EEHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price & discount price
        Row(
          children: [
            ///sale tag
            EERoundedContainer(
              radius: EESizes.sm,
              backgroundColor: EEColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: EESizes.sm, vertical: EESizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EEColors.black)),
            ),
            const SizedBox(width: EESizes.spaceBtwItems),
            ///price
            if(landmark.productType ==ProductType.single.toString() && landmark.salePrice >0)
              Text('\u{20B9}${landmark.price}', style: Theme.of(context).textTheme.bodyMedium!.apply(decoration: TextDecoration.lineThrough)),
            if(landmark.productType ==ProductType.single.toString() && landmark.salePrice >0) const SizedBox(width: EESizes.spaceBtwItems),
             EELandmarkPriceText(price: controller.getLandmarkPrice(landmark), isLarge: true),
          ],
        ),
        const SizedBox(height: EESizes.spaceBtwItems/1.5),
        ///title
         EEProductTitleText(title: landmark.title),
        const SizedBox(height: EESizes.spaceBtwItems/2.5),
        /// state
        Row(
          children: [
            EECircularImage(
                image: landmark.brand != null ? landmark.brand!.image:'',
              width: 32,
              height: 32,
              overlayColor: dark ? EEColors.white: EEColors.black,
            ),
            const SizedBox(width: EESizes.spaceBtwItems/3),

             EEBrandTitleVerifiedIcon(title: landmark.brand != null ? landmark.brand!.name:'', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
