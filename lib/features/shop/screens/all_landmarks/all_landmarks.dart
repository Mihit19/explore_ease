import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:explore_ease/utils/helpers/cloud_helper_function.dart';
import 'package:explore_ease/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/all_landmarks_controller.dart';
import '../../models/product_model.dart';

class AllLandmarks extends StatelessWidget {
  const AllLandmarks({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<LandmarkModel>>? futureMethod;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllLandmarkController());
    return  Scaffold(
      appBar:
          EEAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(EESizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchLandmarksByQuery(query),
          builder: (context, snapshot) {

            //check the state of the future builder snapshot
            const loader = EEVerticalProductShimmer();
            final widget = EECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

            if(widget!=null) return widget;

            //landmarks found
            final landmarks = snapshot.data!;

            return EESortableLandmarks(landmarks: landmarks);
          }
        ),
      ),
    );
  }
}

