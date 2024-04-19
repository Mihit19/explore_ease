import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';

class EERatingProgressIndicator extends StatelessWidget {
  const EERatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: EEDeviceUtils.getScreenWidth(context)*0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: EEColors.grey,
              valueColor: const AlwaysStoppedAnimation(EEColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
