import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shape/container/rounded_container.dart';
import 'brand_card.dart';

class EEBrandShowCase extends StatelessWidget {
  const EEBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return EERoundedContainer(
      showBorder: true,
      borderColour: EEColors.darkGrey,
      padding: const EdgeInsets.all(EESizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: EESizes.spaceBtwItems),
      child: Column(
        children: [
          //brand with landmark count
          const EEBrandCard(showBorder: false),
          const SizedBox(height: EESizes.spaceBtwItems),

          // brand top 3 landmark images
          Row(children: images.map((image) => brandTopLandmarkImageWidget(image , context)).toList())
        ],
      ),
    );
  }

  Widget brandTopLandmarkImageWidget(String image, context){
    return Expanded(
      child: EERoundedContainer(
        height: 100,
        backgroundColor: EEHelperFunctions.isDarkMode(context)? EEColors.darkerGrey:EEColors.light,
        margin: const EdgeInsets.only(right:EESizes.sm),
        padding: const EdgeInsets.all(EESizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image),),
      ),
    );
  }
}
