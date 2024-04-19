import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/features/shop/screens/landmark_reviews/widgets/overall_progress_rating.dart';
import 'package:explore_ease/features/shop/screens/landmark_reviews/widgets/user_review_card.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class LandmarkReviewScreen extends StatelessWidget {
  const LandmarkReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: const EEAppBar(title: Text('Reviews & Rating'), showBackArrow: true),
      ///Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: EESizes.spaceBtwItems),

              ///overall product ratings
              const EEOverallProgressRating(),
              const EERatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: EESizes.spaceBtwSections),

              ///user reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



