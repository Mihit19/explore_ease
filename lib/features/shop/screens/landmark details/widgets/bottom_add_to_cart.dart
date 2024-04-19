import 'package:explore_ease/common/widgets/icons/EE_circular_icon.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EEBottomAddToCart extends StatelessWidget {
  const EEBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: EESizes.defaultSpace, vertical: EESizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? EEColors.darkerGrey : EEColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(EESizes.cardRadiusLg),
              topRight: Radius.circular(EESizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const EECircularIcon(
                icon: Iconsax.minus,
                backgroundColor: EEColors.darkGrey,
                width: 40,
                height: 40,
                color: EEColors.white,
              ),
              const SizedBox(width: EESizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: EESizes.spaceBtwItems),
              const EECircularIcon(
                icon: Iconsax.add,
                backgroundColor: EEColors.darkGrey,
                width: 40,
                height: 40,
                color: EEColors.white,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(EESizes.md),
              backgroundColor: EEColors.black,
              side: const BorderSide(color: EEColors.black),
            ),
              child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
