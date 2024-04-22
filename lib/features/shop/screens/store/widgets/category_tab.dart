import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/product_cards/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class EECategoryTab extends StatelessWidget {
  const EECategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(padding: const EdgeInsets.all(EESizes.defaultSpace),
        child: Column(
          children: [
            //brands
            const EEBrandShowCase(images: [EEImage.landmark1, EEImage.landmark2, EEImage.landmark3],),
            const SizedBox(height: EESizes.spaceBtwItems),
            //landmark
            EESectionHeading(title: 'you might like', onPressed: (){}),
            const SizedBox(height: EESizes.spaceBtwItems),

            EEGridLayout(itemCount: 4, itemBuilder: (_,index) => const EEProductCardVertical())

          ],
        ),
      ),
    ]
    );
  }
}
