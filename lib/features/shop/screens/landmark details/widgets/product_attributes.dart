import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/common/widgets/texts/product_title_text.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/controllers/variation_controller.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EELandmarkAttributes extends StatelessWidget {
  const EELandmarkAttributes({super.key, required this.landmark});

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        () => Column(
        children: [
          ///Selected attribute pricing and description
          //display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            EERoundedContainer(
              padding: const EdgeInsets.all(EESizes.md),
              backgroundColor: dark ? EEColors.darkerGrey : EEColors.grey,
              child: Column(
                children: [
                  ///title,price
                  Row(
                    children: [
                      const EESectionHeading(
                          title: 'Variation', showActionButton: false),
                      const SizedBox(width: EESizes.spaceBtwItems),
                      const EEProductTitleText(
                          title: 'Price :  ', smallSize: true),
                      Row(
                        children: [
                          ///actual price
                          if(controller.selectedVariation.value.salePrice > 0)
                          Text('\u{20B9}${controller.selectedVariation.value.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: EESizes.spaceBtwItems / 1.5),

                          ///sale price
                          EELandmarkPriceText(price: controller.getVariationPrice())
                        ],
                      ),
                    ],
                  ),

                  /// variation description
                   EEProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLine: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: EESizes.spaceBtwItems / 2.5),

          /// attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: landmark.productAttributes!
                  .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EESectionHeading(
                                title: e.name ?? '', showActionButton: false),
                            const SizedBox(height: EESizes.spaceBtwItems / 2),
                            Obx(
                              () => Wrap(
                                  spacing: 10,
                                  children: e.values!.map((value) {
                                    final isSelected =
                                        controller.selectedAttributes[e.name] ==
                                            value;
                                    return EEChoiceChip(
                                        text: value,
                                        selected: isSelected,
                                        onSelected: (selected) {
                                          if (selected) {
                                            controller.onAttributeSelected(
                                                landmark, e.name ?? '', value);
                                          }
                                        });
                                  }).toList()),
                            )
                          ]))
                  .toList())
        ],
      ),
    );
  }
}
