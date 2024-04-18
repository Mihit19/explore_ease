import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/icons/EE_circular_icon.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:explore_ease/features/shop/screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EEAppBar(
        title: Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          EECircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
          ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              EEGridLayout(itemCount: 12, itemBuilder: (_,index) => const EEProductCardVertical())
            ],
          ),
        ),
      ),
      );
  }
}
