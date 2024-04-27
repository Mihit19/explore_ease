import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/controllers/category_controller.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:explore_ease/features/shop/screens/all_landmarks/all_landmarks.dart';
import 'package:explore_ease/features/shop/screens/store/widgets/category_brands.dart';
import 'package:explore_ease/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_function.dart';


class EECategoryTab extends StatelessWidget {
  const EECategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(padding: const EdgeInsets.all(EESizes.defaultSpace),
        child: Column(
          children: [
            //brands
            EECategoryBrands(category: category),

            const SizedBox(height: EESizes.spaceBtwItems),
            //landmark
            FutureBuilder(
              future: controller.getCategoryLandmarks(categoryId: category.id),
              builder: (context, snapshot) {
                final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: const EEVerticalProductShimmer());
                if(widget !=null) return widget;

                ///Record Found!
                final landmarks = snapshot.data!;
                return Column(
                  children: [
                    EESectionHeading(title: 'you might like', onPressed: () =>Get.to(AllLandmarks(
                      title: category.name,
                      futureMethod: controller.getCategoryLandmarks(categoryId: category.id, limit: -1),
                    ))),
                    const SizedBox(height: EESizes.spaceBtwItems),

                    EEGridLayout(itemCount: landmarks.length, itemBuilder: (_,index) => EEProductCardVertical(landmark: landmarks[index]))

                  ],
                );
              }
            ),
          ],
        ),
      ),
    ]
    );
  }
}
