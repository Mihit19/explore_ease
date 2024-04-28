import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/images/EE_rounded_image.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/controllers/category_controller.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:explore_ease/features/shop/screens/all_landmarks/all_landmarks.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/cloud_helper_function.dart';
import 'package:explore_ease/utils/shimmer/horizontal_product_shimmer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: EEAppBar(
        title: Text(category.name),
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
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = EEHorizontalProductShimmer();
                    final widget = EECloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    ///Record found
                    final subCategories = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                            future: controller.getCategoryLandmarks(categoryId: subCategory.id),
                            builder: (context, snapshot) {

                              final widget = EECloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);

                              if (widget != null) return widget;

                              ///Record found
                              final landmarks = snapshot.data!;
                              return Column(
                                children: [
                                  ///Heading
                                  EESectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllLandmarks(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryLandmarks(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          ))),
                                  const SizedBox(height: EESizes.spaceBtwItems / 2),
                              
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: landmarks.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            EEProductCardHorizontal(landmark: landmarks[index]),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                                width: EESizes.spaceBtwItems)),
                                  ),
                                  const SizedBox(height: EESizes.spaceBtwSections,)
                                ],
                              );
                            }
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
