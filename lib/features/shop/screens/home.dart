import 'package:explore_ease/features/shop/screens/widgets/home_appbar.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../common/widgets/custom_shape/container/search_container.dart';
import '../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            EEPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  EEHomeAppBar(),
                  SizedBox(height: EESizes.spaceBtwSections),

                  /// searchbar
                  EESearchContainer(
                    text: 'Search the World',
                    icon: Iconsax.global_search,
                  ),
                  SizedBox(height: EESizes.spaceBtwSections),

                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: EESizes.defaultSpace),
                    child: Column(
                      children: [

                        /// Heading
                        EESectionHeading(title: 'Popular Categories', showActionButton: true, buttonTitle: 'View all',),
                        SizedBox(height: EESizes.spaceBtwItems),
                        /// Categories


                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

