import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EEItineraryListItems extends StatelessWidget {
  const EEItineraryListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (_, index) => EERoundedContainer(
              padding: const EdgeInsets.all(EESizes.md),
              showBorder: true,
              backgroundColor: dark ? EEColors.dark : EEColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.clipboard_text),
                      const SizedBox(width: EESizes.spaceBtwItems),

                      ///Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Made on',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: EEColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text('19 Apr 2024',
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_24,
                              size: EESizes.iconSm))
                    ],
                  ),
                  Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: EESizes.spaceBtwItems),

                      ///itinerary id
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Itinerary',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: EEColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text('[#11111]',
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        separatorBuilder: (_,__) => const SizedBox(height: EESizes.spaceBtwItems),
        itemCount: 8);
  }
}
