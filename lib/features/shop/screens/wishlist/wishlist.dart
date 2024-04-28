import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/icons/EE_circular_icon.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/loader/animation_loader.dart';
import 'package:explore_ease/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:explore_ease/features/shop/controllers/favourite_controller.dart';
import 'package:explore_ease/features/shop/screens/Home/home.dart';
import 'package:explore_ease/navigation_menu.dart';
import 'package:explore_ease/utils/constants/image_strings.dart';
import 'package:explore_ease/utils/helpers/cloud_helper_function.dart';
import 'package:explore_ease/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: EEAppBar(
        title: Text('WishList', style: theme.textTheme.headlineMedium),
        actions: [
          EECircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
          ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              FutureBuilder(
                future: controller.favouriteLandmarks(),
                builder: (context, snapshot) {
                  //nothing found widget
                  final emptyWidget = EEAnimationLoaderWidget(
                      text: 'Whoops! Wishlist is Empty...',
                      animation: EEImage.emptyWishlist,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );
                  const loader = EEVerticalProductShimmer(itemCount: 12);
                  final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader,nothingFound: emptyWidget);
                  if(widget != null) return widget;

                  final landmarks = snapshot.data!;
                  return EEGridLayout(itemCount: landmarks.length, itemBuilder: (_,index) => EEProductCardVertical(landmark: landmarks[index]));
                }
              )
            ],
          ),
        ),
      ),
      );
  }
}
