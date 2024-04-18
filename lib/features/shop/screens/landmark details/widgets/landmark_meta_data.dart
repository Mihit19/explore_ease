import 'package:explore_ease/common/widgets/images/EE_circular_image.dart';
import 'package:explore_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/utils/constants/enums.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EELandmarkMetaData extends StatelessWidget {
  const EELandmarkMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EEColors.black)),
            ),
            const SizedBox(width: EESizes.spaceBtwItems),
            ///price
            Text('\u{20B9}5,000-10,000', style: Theme.of(context).textTheme.bodyMedium!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: EESizes.spaceBtwItems),
            const EELandmarkPriceText(price: '3,750 - 7,500', isLarge: true),
          ],
        ),
        const SizedBox(height: EESizes.spaceBtwItems/1.5),
        ///title
        const EEProductTitleText(title: 'Taj Hotel'),
        const SizedBox(height: EESizes.spaceBtwItems/2.5),
        /// state
        Row(
          children: [
            EECircularImage(
                image: EEImage.tajIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? EEColors.white: EEColors.black,
            ),
            const SizedBox(width: EESizes.spaceBtwItems/3),

            const EEBrandTitleVerifiedIcon(title: 'Goa', brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
