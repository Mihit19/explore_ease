import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/products/ratings/rating_indicator.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EEImage.profile1)),
                const SizedBox(width: EESizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: EESizes.spaceBtwItems),
        
        ///Review
        Row(
          children: [
            const EERatingBarIndicator(rating: 4),
            const SizedBox(width: EESizes.spaceBtwItems),
            Text('19 Apr, 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: EESizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make itineraries seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' show more',
          trimExpandedText: ' show less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

        ),
        const SizedBox(height: EESizes.spaceBtwItems),

        /// company review
        EERoundedContainer(
          backgroundColor: dark? EEColors.darkerGrey:EEColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(EESizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ExploreEase', style: Theme.of(context).textTheme.titleMedium),
                    Text('21 Apr, 2024', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(height: EESizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make itineraries seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' show more',
                  trimExpandedText: ' show less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: EESizes.spaceBtwSections)
      ],
    );
  }
}
