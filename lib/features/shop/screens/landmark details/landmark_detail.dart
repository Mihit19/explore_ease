import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/screens/landmark_reviews/landmark_reviews.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/bottom_add_to_cart.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/product_attributes.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_image_slider.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_meta_data.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/rating_share.dart';
import 'package:explore_ease/utils/constants/enums.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';


class LandmarkDetailScreen extends StatelessWidget {
  const LandmarkDetailScreen({super.key, required this.landmark});

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const EEBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///landmark image slider
             EELandmarkImageSlider(landmark: landmark),

            ///landmark details
            Padding(
                padding: const EdgeInsets.only(
                    right: EESizes.defaultSpace, left: EESizes.defaultSpace, bottom: EESizes.defaultSpace),
              child: Column(
                children: [
                  /// rating and share button
                  const EERatingAndShare(),

                  /// price,title,state
                   EELandmarkMetaData(landmark: landmark,),
                  const SizedBox(height: EESizes.spaceBtwItems/3),
                  /// attributes
                  if(landmark.productType == ProductType.variable.toString()) EELandmarkAttributes(landmark: landmark),
                  if(landmark.productType == ProductType.variable.toString()) const SizedBox(height: EESizes.spaceBtwSections/2),
                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Check Total'))),
                  const SizedBox(height: EESizes.spaceBtwSections),
                  /// description
                  const EESectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  ReadMoreText(
                      landmark.description ?? '',
                      trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// reviews
                  const Divider(),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const EESectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: ()=> Get.to(() => const LandmarkReviewScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: EESizes.spaceBtwSections),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}


