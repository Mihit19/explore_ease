import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:explore_ease/common/widgets/custom_shape/container/search_container.dart';
import 'package:explore_ease/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/EE_circular_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';


class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EEAppBar(title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        EECartCounterIcon(onPressed: (){})
      ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_,innerBoxIsScrolled){
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: EEHelperFunctions.isDarkMode(context)? EEColors.black: EEColors.white,
            expandedHeight: 440,

            flexibleSpace: Padding(
              padding: const EdgeInsets.all(EESizes.defaultSpace),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ///Search bar
                  const SizedBox(height: EESizes.spaceBtwItems),
                  const EESearchContainer(text: 'Search in Store', showBackground: false,showBorder: true, padding: EdgeInsets.zero),
                  const SizedBox(height: EESizes.spaceBtwItems),

                  ///featured brands
                  EESectionHeading(title: 'Featured Brands',onPressed:(){}),
                  const SizedBox(height: EESizes.spaceBtwItems/1.5),

                  EERoundedContainer(
                    padding: const EdgeInsets.all(EESizes.sm),
                    showBorder: true,
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        ///Icon
                        EECircularImage(
                          isNetworkImage: false,
                          image: EEImage.tajIcon,
                          backgroundColor: Colors.transparent,
                          overlayColor: EEHelperFunctions.isDarkMode(context)? EEColors.white: EEColors.black
                        ),
                        const SizedBox(width: EESizes.spaceBtwItems/2,),

                        ///text
                        const Column(
                          children: [

                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
        ];},
          body: Container()),
    );
  }
}

