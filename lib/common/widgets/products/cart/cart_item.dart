import 'package:explore_ease/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/EE_rounded_image.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/product_title_text.dart';

class EECartItem extends StatelessWidget {
  const EECartItem({
    super.key, required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        EERoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(EESizes.sm),
          backgroundColor: EEHelperFunctions.isDarkMode(
              context) ? EEColors.darkerGrey : EEColors.light,
        ),
        const SizedBox(width: EESizes.spaceBtwItems),

        ///title, price & type
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               EEBrandTitleVerifiedIcon(title: cartItem.brandName?? ''),
               Flexible(
                child: EEProductTitleText(
                    title: cartItem.title,
                    maxLine: 1),
              ),

              ///Attributes
              Text.rich(
                  TextSpan(
                      children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(children: [
                        TextSpan(text: e.key,style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: e.value,style: Theme.of(context).textTheme.bodySmall),
                      ])).toList()

                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
