import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/products/sortable/sortable_products.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandLandmarks extends StatelessWidget {
  const BrandLandmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EEAppBar(title: Text('Goa')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              EEBrandCard(showBorder: true),
              SizedBox(height: EESizes.spaceBtwSections),
              EESortableLandmarks(),
            ],
          ),
        ),
      ),
    );
  }
}
