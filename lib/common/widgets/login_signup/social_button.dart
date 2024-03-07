import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class EESocialButton extends StatelessWidget {
  const EESocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: EEColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: EESizes.iconMd,
                height: EESizes.iconMd,
                image: AssetImage(EEImage.google)
            ),
          ),
        ),
        const SizedBox(width: EESizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: EEColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: EESizes.iconMd,
                height: EESizes.iconMd,
                image: AssetImage(EEImage.facebook)
            ),
          ),
        ),
      ],
    );
  }
}