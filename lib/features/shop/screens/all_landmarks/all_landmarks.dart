import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllLandmarks extends StatelessWidget {
  const AllLandmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:
          EEAppBar(title: Text('Popular Landmarks'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(EESizes.defaultSpace),
        child: EESortableLandmarks(),
      ),
    );
  }
}

