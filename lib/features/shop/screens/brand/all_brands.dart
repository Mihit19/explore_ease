
import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/texts/section_heading.dart';
import 'package:explore_ease/features/shop/screens/brand/brand_products.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EEAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              const EESectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: EESizes.spaceBtwItems),

              ///brands
              EEGridLayout(itemCount: 10, mainAxisExtent: 80,itemBuilder: (context,index)=> EEBrandCard(showBorder: true,onTap: () => Get.to(()=> const BrandLandmarks()),)),
            ],
          ),
        ),
      ),
    );
  }
}
