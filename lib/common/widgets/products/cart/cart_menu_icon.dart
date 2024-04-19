import 'package:explore_ease/features/shop/screens/cart/cart.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class EECartCounterIcon extends StatelessWidget {
  const EECartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(()=> const CartScreen()),
            icon: Icon(Iconsax.bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: counterBgColor ?? (dark? EEColors.white: EEColors.black),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: counterTextColor ?? (dark? EEColors.white: EEColors.black), fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
