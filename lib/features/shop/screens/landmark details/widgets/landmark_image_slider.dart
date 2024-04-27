import 'package:cached_network_image/cached_network_image.dart';
import 'package:explore_ease/features/shop/controllers/Image_controller.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/EE_circular_icon.dart';
import '../../../../../common/widgets/images/EE_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';



class EELandmarkImageSlider extends StatelessWidget {
  const EELandmarkImageSlider({
    super.key, required this.landmark,
  });

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {
    final dark=EEHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(landmark);
    return EECurvedEdgesWidget(
      child: Container(
        color: dark ? EEColors.darkerGrey : EEColors.light,
        child: Stack(
          children: [
            ///Main Large image
             SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  const EdgeInsets.all(EESizes.landmarkImageRadius * 2),
                  child: Center(
                      child:
                      Obx((){
                        final image = controller.selectedProductImage.value;
                        return GestureDetector(
                          onTap: () => controller.showEnlargedImage(image),
                          child: CachedNetworkImage(
                              imageUrl: image,
                              progressIndicatorBuilder: (_,__,downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress, color: EEColors.primary),
                          ),
                        );
                      }
                      )
                  ),
                )
            ),

            /// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: EESizes.defaultSpace,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(
                      (){
                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return EERoundedImage(
                          onPressed: () => controller.selectedProductImage.value = images[index],
                          width: 80,
                          isNetworkImage: true,
                          backgroundColor:
                          dark ? EEColors.dark : EEColors.white,
                          border: Border.all(color: imageSelected? EEColors.primary : Colors.transparent),
                          padding: const EdgeInsets.all(EESizes.sm),
                          imageUrl: images[index],
                        );
                      }
                    ),
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: EESizes.spaceBtwItems),
                    itemCount: images.length
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
