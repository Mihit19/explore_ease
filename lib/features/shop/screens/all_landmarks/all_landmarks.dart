import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class AllLandmarks extends StatelessWidget {
  const AllLandmarks({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<LandmarkModel>>? futureMethod;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
          EEAppBar(title: Text(title), showBackArrow: true),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(EESizes.defaultSpace),
        child: EESortableLandmarks(),
      ),
    );
  }
}

