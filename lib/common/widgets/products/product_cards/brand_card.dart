import 'package:explore_ease/features/shop/models/state_model.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shape/container/rounded_container.dart';
import '../../images/EE_circular_image.dart';
import '../../texts/brand_title_verified_icon.dart';

class EEBrandCard extends StatelessWidget {
  const EEBrandCard({
    super.key, required this.showBorder, this.onTap, required this.state,
  });

  final bool showBorder;
  final void Function()? onTap;
  final StateModel state;

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
            Flexible(
              child: EECircularImage(
                isNetworkImage: true,
                image: state.image,
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
                  EEBrandTitleVerifiedIcon(
                    title: state.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text('${state.landmarksCount ?? 0} landmarks',
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
