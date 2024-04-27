import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/common/widgets/products/product_cards/brand_card.dart';
import 'package:explore_ease/common/widgets/products/sortable/sortable_products.dart';
import 'package:explore_ease/features/shop/controllers/state_controller.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/cloud_helper_function.dart';
import 'package:explore_ease/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

import '../../models/state_model.dart';

class BrandLandmarks extends StatelessWidget {
  const BrandLandmarks({super.key, required this.state});

  final StateModel state;
  @override
  Widget build(BuildContext context) {
    final controller = StateController.instance;
    return Scaffold(
      appBar: EEAppBar(title: Text(state.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              EEBrandCard(showBorder: true,state: state),
              const SizedBox(height: EESizes.spaceBtwSections),
              FutureBuilder(
                future: controller.getStateLandmarks(stateId: state.id),
                builder: (context, snapshot) {
                  const loader = EEVerticalProductShimmer();
                  final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;
                  ///Record found
                  final stateLandmarks = snapshot.data!;
                  return EESortableLandmarks(landmarks: stateLandmarks);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
