import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = EEColors.white,
    this.backgroundColor = true,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final bool backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: EESizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(EESizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ? (dark? EEColors.black : EEColors.white) : null,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: EESizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
