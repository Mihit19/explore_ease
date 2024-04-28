import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/features/shop/controllers/itinerary_controller.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/loader/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';

class EEItineraryListItems extends StatelessWidget {
  const EEItineraryListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItineraryController());
    final dark = EEHelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserItineraries(),
      builder: (context, snapshot) {
        /// Nothing Found Widget
        final emptyWidget = EEAnimationLoaderWidget(
            text: 'Whoops! No Plans Yet!',
            animation: EEImage.itinerarySaved,
            showAction: true,
            actionText: 'Let\'s make them',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
        ); // TAnimationLoaderWidget
        /// Helper Function: Handle Loader, No Record, OR ERROR Message
        final response = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;
        /// Congratulations Record found.
        final itineraries = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
            itemCount: itineraries.length,
          separatorBuilder: (_,__) => const SizedBox(height: EESizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final itinerary = itineraries[index];
            return EERoundedContainer(
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
                            Text(itinerary.formattedOrderDate,
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                            Text(itinerary.id,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }


            );
      }
    );
  }
}
