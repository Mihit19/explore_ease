import 'package:explore_ease/features/shop/controllers/cart_controller.dart';
import 'package:explore_ease/features/shop/models/product_model.dart';
import 'package:explore_ease/features/shop/screens/landmark%20details/landmark_detail.dart';
import 'package:explore_ease/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.landmark,
  });

  final LandmarkModel landmark;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (landmark.productType == ProductType.single.toString()) {
          final cartItem = controller.convertToCartItem(landmark, 1);
          controller.addOneToCart(cartItem);
        } else {
          Get.to(() => LandmarkDetailScreen(landmark: landmark));
        }
      },
      child: Obx(
              () {
            final landmarkQuantityInCart = controller.getProductQuantityInCart(
                landmark.id);
            return Container(
                decoration: BoxDecoration(
                  color: landmarkQuantityInCart > 0
                      ? EEColors.primary
                      : EEColors.dark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(EESizes.cardRadiusMd),
                    bottomRight: Radius.circular(EESizes.landmarkImageRadius),
                  ),
                ),
                child: SizedBox(
                    width: EESizes.iconLg * 1.2,
                    height: EESizes.iconLg * 1.2,
                    child: Center(
                      child: landmarkQuantityInCart > 0 ? Text(
                          landmarkQuantityInCart.toString(), style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: EEColors.white)) :
                      const Icon(Iconsax.add, color: EEColors.white)
                    )
                )
            );
              }
      ),
    );
  }
}
