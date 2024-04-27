import 'package:cached_network_image/cached_network_image.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(LandmarkModel landmark) {
    Set<String> images = {};

    images.add(landmark.thumbnail);

    selectedProductImage.value = landmark.thumbnail;

    if (landmark.images != null) {
      images.addAll(landmark.images!);
    }

    if (landmark.productVariations != null ||
        landmark.productVariations!.isNotEmpty) {
      images.addAll(landmark.productVariations!.map((e) => e.image));
    }

    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: EESizes.defaultSpace * 2,
                      horizontal: EESizes.defaultSpace),
                  child: CachedNetworkImage(imageUrl: image),
                ),
                const SizedBox(height: EESizes.spaceBtwSections),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150,
                    child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Close')),
                  ),
                )
              ],
            )));
  }
}
