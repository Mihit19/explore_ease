
import 'package:explore_ease/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:explore_ease/features/shop/screens/home/widgets/home_categories.dart';
import 'package:explore_ease/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shape/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            const EEPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  EEHomeAppBar(),
                  SizedBox(height: EESizes.spaceBtwSections),

                  /// searchbar
                  EESearchContainer(
                    text: 'Search the WORLD!',
                    icon: Iconsax.search_normal_1,
                  ),
                  SizedBox(height: EESizes.spaceBtwSections),

                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: EESizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        EESectionHeading(
                          title: 'Popular Categories',
                          showActionButton: true,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: EESizes.spaceBtwItems),

                        /// Categories
                        EEHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(EESizes.defaultSpace),
              child: Column(
                children: [
                  const EEPromoSlider(banners: [
                    EEImage.banner1,
                    EEImage.banner2,
                    EEImage.banner3
                  ]),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  EESectionHeading(title: 'Popular Landmarks', onPressed: (){}),
                  const SizedBox(height: EESizes.spaceBtwItems),
                  EEGridLayout(itemCount: 8,itemBuilder: (_, index) => const EEProductCardVertical(),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

