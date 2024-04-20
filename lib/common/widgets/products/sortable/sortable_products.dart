import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class EESortableLandmarks extends StatelessWidget {
  const EESortableLandmarks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'sale',
            'Newest',
            'Popularity'
          ].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: EESizes.spaceBtwSections),

        ///products
        EEGridLayout(itemCount: 8, itemBuilder: (_,index)=> const EEProductCardVertical()),
      ],
    );
  }
}
