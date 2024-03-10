import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EETermsAndConditionCheckBox extends StatelessWidget {
  const EETermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: EESizes.spaceBtwItems,),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: '${EETexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: EETexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? EEColors.white : EEColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? EEColors.white : EEColors.primary,),),
            TextSpan(text: ' ${EETexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: EETexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? EEColors.white : EEColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? EEColors.white : EEColors.primary,
            ),
            ),
          ],
        ),
        ),
      ],
    );
  }
}