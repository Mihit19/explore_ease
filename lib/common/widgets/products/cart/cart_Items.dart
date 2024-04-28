import 'package:explore_ease/features/shop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../texts/landmark_price_text.dart';
import 'add_remove_button.dart';
import 'cart_item.dart';

class EECartItems extends StatelessWidget {
  const EECartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
                height: EESizes.spaceBtwSections,
              ),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
            final item = controller.cartItems[index];
                return Column(
                  children: [
                    EECartItem(cartItem: item),
                    if (showAddRemoveButtons)
                      const SizedBox(height: EESizes.spaceBtwItems),
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ///Extra space
                              const SizedBox(width: 70),

                              ///Add remove buttons
                              EEProductQuantityWithAddRemove(
                                quantity: item.quantity,
                                add: () => controller.addOneToCart(item),
                                remove: () => controller.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          ///price
                          EELandmarkPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              })),
    );
  }
}
