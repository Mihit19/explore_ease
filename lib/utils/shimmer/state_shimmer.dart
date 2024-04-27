import 'package:explore_ease/common/widgets/layouts/grid_layout.dart';
import 'package:explore_ease/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class EEStateShimmer extends StatelessWidget {
  const EEStateShimmer({super.key,this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EEGridLayout(
      mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_,__) => const EEShimmerEffect(width: 300, height: 80));
  }
}
