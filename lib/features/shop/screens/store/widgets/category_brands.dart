import 'package:explore_ease/common/widgets/products/product_cards/brand_show_case.dart';
import 'package:explore_ease/features/shop/controllers/state_controller.dart';
import 'package:explore_ease/features/shop/models/category_model.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/cloud_helper_function.dart';
import 'package:explore_ease/utils/shimmer/boxes_shimmer.dart';
import 'package:explore_ease/utils/shimmer/list_tile_shimmer.dart';
import 'package:flutter/material.dart';

class EECategoryBrands extends StatelessWidget {
  const EECategoryBrands({super.key, required this.category});
  
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = StateController.instance;
    return FutureBuilder(
      future: controller.getStatesForCategory(category.id),
      builder: (context, snapshot) {

        ///handle loader, no record or error message
        const loader = Column(
          children: [
            EEListTileShimmer(),
            SizedBox(height: EESizes.spaceBtwItems),
            EEBoxesShimmer(),
            SizedBox(height: EESizes.spaceBtwItems),
          ],
        );

        final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
        if(widget !=null) return widget;

        ///Record Found!
        final states = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const  NeverScrollableScrollPhysics(),
          itemCount: states.length,
          itemBuilder: (_,index){
            final state = states[index];
            return FutureBuilder(
              future: controller.getStateLandmarks(stateId: state.id, limit: 3),
              builder: (context, snapshot) {
                final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget !=null) return widget;

                ///Record Found!
                final landmarks = snapshot.data!;
                return EEBrandShowCase(state: state,images: landmarks.map((e) => e.thumbnail).toList());
              }
            );
          },
        );
      }
    );
  }
}
