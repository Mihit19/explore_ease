import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/EE_circular_icon.dart';
import '../../../../../common/widgets/images/EE_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';



class EELandmarkImageSlider extends StatelessWidget {
  const EELandmarkImageSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final dark=EEHelperFunctions.isDarkMode(context);
    return EECurvedEdgesWidget(
      child: Container(
        color: dark ? EEColors.darkerGrey : EEColors.light,
        child: Stack(
          children: [
            ///Main Large image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(EESizes.landmarkImageRadius * 2),
                  child: Center(
                      child:
                      Image(image: AssetImage(EEImage.landmark1))),
                )),

            /// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: EESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => EERoundedImage(
                        width: 80,
                        backgroundColor:
                        dark ? EEColors.dark : EEColors.white,
                        border: Border.all(color: EEColors.primary),
                        padding: const EdgeInsets.all(EESizes.sm),
                        imageUrl: EEImage.landmark1),
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: EESizes.spaceBtwItems),
                    itemCount: 6
                ),
              ),
            ),

            /// Appbar Icons
            const EEAppBar(
              showBackArrow: true,
              actions: [
                EECircularIcon(icon: Iconsax.heart5,color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
