import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/texts/landmark_price_text.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EEAppBar(
          showBackArrow: true,
          title:
          Text('Cart', style: Theme
              .of(context)
              .textTheme
              .headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(EESizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) =>
            const SizedBox(
              height: EESizes.spaceBtwSections,
            ),
            itemCount: 8,
            itemBuilder: (_, index) =>
                const Column(
                  children: [
                    EECartItem(),
                    SizedBox(height: EESizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ///Extra space
                            SizedBox(width: 70),
                            ///Add remove buttons
                            EEProductQuantityWithAddRemove(),
                          ],
                        ),

                        ///price
                        EELandmarkPriceText(price: '5,000'),
                      ],
                    )
                  ],
                )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: ElevatedButton(onPressed: (){}, child: const Text('Save \u{20B9}5,000'))),
    );
  }
}


