import 'package:flutter/material.dart';

class EELandmarkPriceText extends StatelessWidget {
  const EELandmarkPriceText({
    super.key,
    required this.price,
    this.maxLines=1,
    this.isLarge = false,
    this.lineThrough= false,
  });

  final String price;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u{20B9}$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough? TextDecoration.lineThrough : null),
    );
  }
}
