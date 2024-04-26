import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/screens/landmark_reviews/landmark_reviews.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/bottom_add_to_cart.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/product_attributes.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_image_slider.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_meta_data.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/rating_share.dart';
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
            const EELandmarkImageSlider(),

            ///landmark details
            Padding(
                padding: const EdgeInsets.only(
                    right: EESizes.defaultSpace, left: EESizes.defaultSpace, bottom: EESizes.defaultSpace),
              child: Column(
                children: [
                  /// rating and share button
                  const EERatingAndShare(),

                  /// price,title,state
                  const EELandmarkMetaData(),
                  const SizedBox(height: EESizes.spaceBtwItems/3),
                  /// attributes
                  const EELandmarkAttributes(),
                  const SizedBox(height: EESizes.spaceBtwSections/2),
                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Check Total'))),
                  const SizedBox(height: EESizes.spaceBtwSections),
                  /// description
                  const EESectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  const ReadMoreText(
                      '''Facilities: Parking , Bar , Wifi , Pool , Food 
                      
Located in the tranquil Benaulim, Goa, overlooking the Arabian Sea, Taj Exotica Resort & Spa offers a laid-back, luxury experience. The resort boasts lush greenery spread over 56 acres, featuring deluxe suites and villa rooms with old-world charm. It"s an ideal destination for romantic getaways or family vacations. The resort's 4,600 square feet Ballroom caters to social events and destination weddings. Indulge in diverse cuisines, relax by the pool, and enjoy rejuvenating therapies at J Wellness Circle. For the adventurous, water sports and various sports activities are available. Let the attentive staff pamper you while exploring Goa's historic sites and attractions.''',
                      trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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


