import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/favourite_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/EE_circular_icon.dart';
import 'package:get/get.dart';

class EEFavouriteIcon extends StatelessWidget {
  const EEFavouriteIcon({super.key, required this.landmarkId});

  final String landmarkId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => EECircularIcon(
        icon: controller.isFavourite(landmarkId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(landmarkId) ? EEColors.error : null,
        onPressed: () => controller.toggleFavouriteLandmark(landmarkId),
      ),
    );
  }
}
