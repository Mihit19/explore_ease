import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EELandmarkAttributes extends StatelessWidget {
  const EELandmarkAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///Selected attribute pricing and description
        EERoundedContainer(
          padding: const EdgeInsets.all(EESizes.md),
          backgroundColor: dark ? EEColors.darkerGrey : EEColors.grey,
          child: Column(
            children: [
              ///title,price
              Row(
                children: [
                  const EESectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: EESizes.spaceBtwItems),
                  const EEProductTitleText(title: 'Price :  ', smallSize: true),
                  Row(
                    children: [
                      ///actual price
                      Text('\u{20B9}7,000',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(decoration: TextDecoration.lineThrough)),
                      const SizedBox(width: EESizes.spaceBtwItems/1.5),

                      ///sale price
                      const EELandmarkPriceText(price: '5,250')
                    ],
                  ),
                ],
              ),

              /// variation description
              const EEProductTitleText(
                title: 'This is the description of the landmark variation and it can go upto max 4 lines',
                smallSize: true,
                maxLine: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: EESizes.spaceBtwItems),

        /// attributes
        Column(

        )
      ],
    );
  }
}
