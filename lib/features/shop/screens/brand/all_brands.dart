import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/controllers/state_controller.dart';
import 'package:explore_ease/features/shop/screens/brand/brand_products.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/shimmer/state_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stateController = StateController.instance;
    return Scaffold(
      appBar: const EEAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              const EESectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: EESizes.spaceBtwItems),

              ///States GRID
              Obx(
                      (){
                    if(stateController.isLoading.value) return const EEStateShimmer();

                    if (stateController.allStates.isEmpty){
                      return Center(
                        child: Text('No Date Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                      );
                    }
                    return EEGridLayout(
                        itemCount: stateController.allStates.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final state = stateController.allStates[index];
                          return EEBrandCard(
                            state: state,
                            showBorder: false,
                            onTap: () => Get.to(() => BrandLandmarks(state: state)),
                          );
                        });
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
