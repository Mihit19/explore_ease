import 'package:explore_ease/features/shop/controllers/all_landmarks_controller.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class EESortableLandmarks extends StatelessWidget {
  const EESortableLandmarks({
    super.key, required this.landmarks,
  });

  final List<LandmarkModel> landmarks;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllLandmarkController());
    controller.assignLandmarks(landmarks);
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            //sort products based on the selected options
            controller.sortLandmarks(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'sale',
            'Newest',
            'Popularity'
          ].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: EESizes.spaceBtwSections),

        ///products
        Obx(() => EEGridLayout(itemCount: controller.landmarks.length, itemBuilder: (_,index)=> EEProductCardVertical(landmark: controller.landmarks[index]))),
      ],
    );
  }
}
