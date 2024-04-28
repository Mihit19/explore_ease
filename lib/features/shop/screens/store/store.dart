import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/search_container.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/controllers/category_controller.dart';
import 'package:explore_ease/features/shop/controllers/state_controller.dart';
import 'package:explore_ease/features/shop/screens/brand/all_brands.dart';
import 'package:explore_ease/features/shop/screens/brand/brand_products.dart';
import 'package:explore_ease/features/shop/screens/store/widgets/category_tab.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/shimmer/state_shimmer.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final stateController = Get.put(StateController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: EEAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [EECartCounterIcon(iconColor: EEColors.white,counterBgColor: EEColors.black,counterTextColor: EEColors.white)],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: EEHelperFunctions.isDarkMode(context)
                        ? EEColors.black
                        : EEColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(EESizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ///Search bar
                          const SizedBox(height: EESizes.spaceBtwItems),
                          const EESearchContainer(
                              text: 'Search in Store',
                              showBackground: false,
                              showBorder: true,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: EESizes.spaceBtwItems),

                          ///featured brands
                          EESectionHeading(title: 'Featured States', onPressed: () => Get.to(()=> const AllBrandsScreen())),
                          const SizedBox(height: EESizes.spaceBtwItems / 1.5),

                          ///States GRID
                          Obx(
                              (){
                                if(stateController.isLoading.value) return const EEStateShimmer();

                                if (stateController.featuredStates.isEmpty){
                                  return Center(
                                    child: Text('No Date Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                                  );
                                }
                                return EEGridLayout(
                                    itemCount: stateController.featuredStates.length,
                                    mainAxisExtent: 80,
                                    itemBuilder: (_, index) {
                                      final state = stateController.featuredStates[index];
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
                    bottom: EETabBar(
                        tabs: categories.map((category) => Tab(
                          child: Text(category.name),
                        )).toList()
                    )
                ),
              ];
            },
            body: TabBarView(
              children: categories.map((category) => EECategoryTab(category: category)).toList(),
            )),
      ),
    );
  }
}
