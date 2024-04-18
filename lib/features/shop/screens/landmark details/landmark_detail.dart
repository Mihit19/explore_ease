import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:explore_ease/common/widgets/icons/EE_circular_icon.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_attributes.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_image_slider.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/landmark_meta_data.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/widgets/rating_share.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LandmarkDetailScreen extends StatelessWidget {
  const LandmarkDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///landmark image slider
            EELandmarkImageSlider(),

            ///landmark details
            Padding(
                padding: EdgeInsets.only(
                    right: EESizes.defaultSpace, left: EESizes.defaultSpace, bottom: EESizes.defaultSpace),
              child: Column(
                children: [
                  /// rating and share button
                  EERatingAndShare(),

                  /// price,title,state
                  EELandmarkMetaData(),
                  /// attributes
                  EELandmarkAttributes(),

                  /// checkout button
                  /// description
                  /// reviews
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}


