import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EEAppBar(
        title: Text('Hotels'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const EERoundedImage(
                  imageUrl: EEImage.banner2,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: EESizes.spaceBtwSections),

              ///Sub-categories
              Column(
                children: [
                  ///Heading
                  EESectionHeading(title: 'Luxury Hotels', onPressed: () {}),
                  const SizedBox(height: EESizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const EEProductCardHorizontal(),
                      separatorBuilder: (context,index)=>const SizedBox(width: EESizes.spaceBtwItems)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
