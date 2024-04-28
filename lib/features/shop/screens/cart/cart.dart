import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/loader/animation_loader.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/features/shop/controllers/cart_controller.dart';
import 'package:explore_ease/features/shop/screens/itineraries/itinerary.dart';
import 'package:explore_ease/navigation_menu.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_Items.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: EEAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          final emptyWidget = EEAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY',
            animation: EEImage.emptyCart,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(EESizes.defaultSpace),
                  child: EECartItems()),
            );
          }
        },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(EESizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const ItineraryScreen()),
                  child: Obx(() => Text(
                      'Save \u{20B9}${controller.totalCartPrice.value}')))),
    );
  }
}
