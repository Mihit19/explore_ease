import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/search_container.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/screens/store/widgets/category_tab.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: EEAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [EECartCounterIcon(onPressed: () {})],
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
                          EESectionHeading(
                              title: 'Featured States', onPressed: () {}),
                          const SizedBox(height: EESizes.spaceBtwItems / 1.5),

                          EEGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const EEBrandCard(
                                  showBorder: false,
                                );
                              })
                        ],
                      ),
                    ),
                    bottom: const EETabBar(tabs: [
                      Tab(child: Text('Hotels')),
                      Tab(child: Text('Restaurants')),
                      Tab(child: Text('Adventure')),
                      Tab(child: Text('Malls')),
                      Tab(child: Text('Monuments')),
                      Tab(child: Text('Beaches')),
                    ])),
              ];
            },
            body: const TabBarView(
              children: [
                EECategoryTab(),
                EECategoryTab(),
                EECategoryTab(),
                EECategoryTab(),
                EECategoryTab(),
                EECategoryTab(),
              ],
            )),
      ),
    );
  }
}
