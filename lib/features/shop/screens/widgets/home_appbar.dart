import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class EEHomeAppBar extends StatelessWidget {
  const EEHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EEAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(EETexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: EEColors.grey)),
        Text(EETexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EEColors.white)),
      ],
    ),
      actions: [
        EECartCounterIcon(onPressed: (){}, iconColor: EEColors.white,)
      ],
    );
  }
}
