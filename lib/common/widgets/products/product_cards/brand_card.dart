import 'package:flutter/material.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shape/container/rounded_container.dart';
import '../../images/EE_circular_image.dart';
import '../../texts/brand_title_verified_icon.dart';

class EEBrandCard extends StatelessWidget {
  const EEBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: EERoundedContainer(
        padding: const EdgeInsets.all(EESizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            const Flexible(
              child: EECircularImage(
                isNetworkImage: false,
                image: EEImage.tajIcon,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: EESizes.spaceBtwItems / 2,
            ),

            ///text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const EEBrandTitleVerifiedIcon(
                    title: 'Goa',
                    brandTextSize: TextSizes.large,
                  ),
                  Text('100 landmarks',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
