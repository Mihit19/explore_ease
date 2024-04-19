import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/EE_circular_icon.dart';

class EEProductQuantityWithAddRemove extends StatelessWidget {
  const EEProductQuantityWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        EECircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: EESizes.md,
          color: EEHelperFunctions.isDarkMode(context)? EEColors.white: EEColors.black,
          backgroundColor: EEHelperFunctions.isDarkMode(context)? EEColors.darkerGrey: EEColors.light,
        ),

        const SizedBox(width: EESizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: EESizes.spaceBtwItems),

        const EECircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: EESizes.md,
          color: EEColors.white,
          backgroundColor: EEColors.primary,
        ),
      ],
    );
  }
}
