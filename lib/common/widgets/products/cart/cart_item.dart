import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/EE_rounded_image.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/product_title_text.dart';

class EECartItem extends StatelessWidget {
  const EECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        ///Image
        EERoundedImage(
          imageUrl: EEImage.landmark1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(EESizes.sm),
          backgroundColor: EEHelperFunctions.isDarkMode(
              context) ? EEColors.darkerGrey : EEColors.light,
        ),
        const SizedBox(width: EESizes.spaceBtwItems),

        ///title, price & type
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EEBrandTitleVerifiedIcon(title: 'Goa'),
              const Flexible(
                child: EEProductTitleText(
                    title: 'Taj Exotica Resort & spa',
                    maxLine: 1),
              ),

              ///Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Room', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Suite', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'View', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Pool View', style: Theme.of(context).textTheme.bodyLarge),
                      ]

                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
