import 'package:cached_network_image/cached_network_image.dart';
import 'package:explore_ease/features/shop/models/state_model.dart';
import 'package:explore_ease/features/shop/screens/brand/brand_products.dart';
import 'package:explore_ease/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shape/container/rounded_container.dart';
import 'brand_card.dart';
import 'package:get/get.dart';

class EEBrandShowCase extends StatelessWidget {
  const EEBrandShowCase({
    super.key,
    required this.images, required this.state,
  });

  final StateModel state;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandLandmarks(state: state)),
      child: EERoundedContainer(
        showBorder: true,
        borderColour: EEColors.darkGrey,
        padding: const EdgeInsets.all(EESizes.md),
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: EESizes.spaceBtwItems),
        child: Column(
          children: [
            //brand with landmark count
            EEBrandCard(showBorder: false, state: state),
            const SizedBox(height: EESizes.spaceBtwItems),

            // brand top 3 landmark images
            Row(children: images.map((image) => brandTopLandmarkImageWidget(image , context)).toList())
          ],
        ),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context,url,downloadProgress) => const EEShimmerEffect(width: 100, height: 100),
          errorWidget: (context,url,error) => const Icon(Icons.error),
        )
      ),
    );
  }
}
